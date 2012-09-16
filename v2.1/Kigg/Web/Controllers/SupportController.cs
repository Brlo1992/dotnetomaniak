using System;
using System.Collections.Generic;

namespace Kigg.Web
{
    using System.Web.Mvc;
    using Repository;

    using DomainObjects;
    using Infrastructure;

    public class SupportController : BaseController
    {
        private readonly IEmailSender _emailSender;
        private readonly IStoryRepository _storyRepository;

        public SupportController(IStoryRepository storyRepository, IEmailSender emailSender)
        {
            Check.Argument.IsNotNull(storyRepository, "storyRepository");
            Check.Argument.IsNotNull(emailSender, "emailSender");

            _storyRepository = storyRepository;
            _emailSender = emailSender;
        }

        [Compress]
        public ActionResult Faq()
        {
            return PreparedView();
        }

        [Compress]
        public ActionResult PromoteSite()
        {
            var viewData = CreateViewData<PromoteSiteViewData>();
            viewData.Items = new List<PromoteItem>
                                  {
                                      new PromoteItem { Url= Url.Image("logo.png"), Text = "Du�e pe�ne logo"},
                                      new PromoteItem { Url = Url.Image("text.png"), Text = "Logo tekstowe"},
                                      new PromoteItem { Url = Url.Image("mozg.png"), Text = "Grafika"},
                                      new PromoteItem { Url = Url.Image("badge.png"), Text="'Wlepka' na blog"},
                                      new PromoteItem {Url = Url.Image("badge2.png"), Text = "'Wlepka' na blog - stonowana"}                                      
                                  };
            return View(viewData);
        }

        [AcceptVerbs(HttpVerbs.Get), Compress]
        public ActionResult Contact()
        {
            return PreparedView();
        }

        [AcceptVerbs(HttpVerbs.Post), Compress]
        public ActionResult Contact(string email, string name, string message)
        {
            JsonViewData viewData = Validate<JsonViewData>(
                                                                new Validation(() => string.IsNullOrEmpty(email), "Pole e-mail nie mo�e by� puste."),
                                                                new Validation(() => !email.IsEmail(), "Niepoprawny adres e-mail."),
                                                                new Validation(() => string.IsNullOrEmpty(name), "Nazwa nie mo�e by� puste."),
                                                                new Validation(() => name.Length < 4, "Nazwa nie mo�e by� kr�tsza ni� 4 znaki."),
                                                                new Validation(() => string.IsNullOrEmpty(message), "Wiadomo�� nie mo�e by� pusta."),
                                                                new Validation(() => message.Length < 16, "Wiadomo�� nie mo�e by� kr�tsza ni� 16 znak�w.")
                                                          );

            if (viewData == null)
            {
                _emailSender.NotifyFeedback(email, name, message);
                viewData = new JsonViewData { isSuccessful = true };
            }

            return Json(viewData);
        }

        [Compress]
        public ActionResult About()
        {
            return PreparedView();
        }

        public ActionResult ControlPanel()
        {
            ControlPanelViewData viewData = new ControlPanelViewData();

            if (!IsCurrentUserAuthenticated || !CurrentUser.CanModerate())
            {
                viewData.ErrorMessage = "Nie masz uprawnie� do ogl�dania tej cz�ci.";
            }
            else
            {
                viewData.IsAdministrator = CurrentUser.IsAdministrator();
                viewData.NewCount = _storyRepository.CountByNew();
                viewData.UnapprovedCount = _storyRepository.CountByUnapproved();

                DateTime currentTime = SystemTime.Now();
                DateTime minimumDate = currentTime.AddHours(-Settings.MaximumAgeOfStoryInHoursToPublish);
                DateTime maximumDate = currentTime.AddHours(-Settings.MinimumAgeOfStoryInHoursToPublish);

                viewData.PublishableCount = _storyRepository.CountByPublishable(minimumDate, maximumDate);
            }

            return View(viewData);
        }

        private ActionResult PreparedView()
        {
            return View(CreateViewData<SupportViewData>());
        }
    }
}
