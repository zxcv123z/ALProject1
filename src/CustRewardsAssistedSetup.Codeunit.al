codeunit 50102 "Cust Rewards Assisted Setup"
{
    trigger OnRun()
    begin

    end;

    //[EventSubscriber(ObjectType::Codeunit, Codeunit::"Guided Experience", 'OnRegisterAssistedSetup', '', false, false)]
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Assisted Setup", 'OnRegister', '', false, false)]
    local procedure AddExtensionAssistedSetup_OnRegisterAssistedSetup();
    var
        //GuidedExperience: Codeunit "Guided Experience";
        GuidedExperience: Codeunit "Assisted Setup";
        CurrentGlobalLanguage: Integer;
        myAppInfo: ModuleInfo;
        WizardTxt: Label 'Customer Rewards assisted setup guide';
        //GuidedExperienceType : Enum "Guided Experience Type";
        GuidedExperienceType : Enum "Assisted Setup Group";
        VideoCategory : Enum "Video Category";
    begin
        NavApp.GetCurrentModuleInfo(myAppInfo);
        CurrentGlobalLanguage := GlobalLanguage();
        //GuidedExperience.InsertAssistedSetup(WizardTxt, WizardTxt, WizardTxt,5,ObjectType::Page,page::"Customer Rewards Wizard","Assisted Setup Group"::Extensions,'',VideoCategory::Uncategorized,'');
        GuidedExperience.Add(CreateGuid(), page::"Customer Rewards Wizard", WizardTxt, "Assisted Setup Group"::Extensions);
        GLOBALLANGUAGE(1033);
        // GuidedExperience.AddTranslationForSetupObjectTitle(GuidedExperienceType::"Assisted Setup", ObjectType::Page,Page::"Customer Rewards Wizard", CurrentGlobalLanguage, WizardTxt);
        GuidedExperience.AddTranslation(Page::"Customer Rewards Wizard", CurrentGlobalLanguage, WizardTxt);
    end;
}