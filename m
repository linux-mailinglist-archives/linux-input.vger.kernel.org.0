Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9298292636
	for <lists+linux-input@lfdr.de>; Mon, 19 Oct 2020 13:10:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727626AbgJSLKn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 19 Oct 2020 07:10:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725776AbgJSLKn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 19 Oct 2020 07:10:43 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92D32C0613CE
        for <linux-input@vger.kernel.org>; Mon, 19 Oct 2020 04:10:43 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id n9so5816580pgf.9
        for <linux-input@vger.kernel.org>; Mon, 19 Oct 2020 04:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jJe2L7D90dwZjIuN8weslTEdE7ipi7Ehuc5iiEXpPI0=;
        b=gQNE5dtm6eL1kPLsXLMKoUN+N716yPVu1fpRhJLLB9cK3GIxgcY7kwqqFipvjC6lBT
         P6fo+rKLU7liulkSd6uoKztFiJQ8yPs6gpJe2XemkHJmC3mXTpVwaxn00hobcgXqT+Xw
         J1QpvMst35PYJgEI//gr+mnNOWrCI+489STP7/g6p0g8a36x2BkkcLH3KuVCxqXhN3ZY
         x2AXqh/Kagk9VLdiXl4b+QRKq47ZTLK4tUj1zUX+Z8lM9PUb20mh24gmz+uRGt41E3Ev
         QdatIW684v6Z914BZ8LJ8NRuocgg1tqKKi9IwDozX+mZU7H44sGsNnVgPveh4ib1Iei9
         nGng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jJe2L7D90dwZjIuN8weslTEdE7ipi7Ehuc5iiEXpPI0=;
        b=rP9/GNUy1zobFwAeC1wf6QWOdYyIUmtHiUmzZa4hWulQ9vgYRE0WInxil58eLwTQGb
         gu+HlfpObf1TnlpaqMMG88+C/I3mTAM24YaGEqSYSg2Ah5EMHhGpY9aycmg/jyuHmFar
         x0Ih4wK+51ainau7HnzoNHn5ly0iiwybXTSdVgl1mlriyzbKQrzs7oomKO/Gtc3eFIvy
         hb3WTMQTXCCmhciy0aLbP1/T2jwf3MJgP9TsCvgo0ua4a1FEHKwbQVYMih+iWi0KTCXU
         E9cqSdHA2d9PwxF8xymzUXVH3I/JcHNy+jM0cmVyzUTC/BFsKKscRUNpLkw15dRqDGt5
         JB7g==
X-Gm-Message-State: AOAM532u7WQi+III9dCWB70VVx3jkFhkWJ0KPe6tU3fOeSyXWzQDFkDx
        BbNs6IoyRYDmTlZZOmw9plIST1YqyHGN/dy9cCw=
X-Google-Smtp-Source: ABdhPJyCvu81cqsE5RjBnf4+YCOwVUniAmxeoXuZIuXx26zUdehCszsKfu4vbqxfczvwIKvltYm7UC82TLSS7x6XatM=
X-Received: by 2002:a63:f908:: with SMTP id h8mr6752731pgi.203.1603105842868;
 Mon, 19 Oct 2020 04:10:42 -0700 (PDT)
MIME-Version: 1.0
References: <20201013073508.10476-1-luke@ljones.dev> <CAHp75VfOV2DvngsO87PLXwNKQtR-RaC4XzbBk_7wDVSEaBMrzw@mail.gmail.com>
 <8P2FIQ.M2MLXE7M40153@ljones.dev> <b95839dc-82eb-7413-9000-17939f21b35b@redhat.com>
In-Reply-To: <b95839dc-82eb-7413-9000-17939f21b35b@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 19 Oct 2020 14:11:32 +0300
Message-ID: <CAHp75VdUipcuHaapttW05n+C5Txw0AS9xstoeLKbiqsKxx14Kg@mail.gmail.com>
Subject: Re: [PATCH V8] HID: ASUS: Add support for ASUS N-Key keyboard
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Luke Jones <luke@ljones.dev>,
        linux-input <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Oct 19, 2020 at 12:54 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 10/18/20 11:36 PM, Luke Jones wrote:

> >>>  +               if (report->id == FEATURE_KBD_LED_REPORT_ID1 ||
> >>>  +                               report->id == FEATURE_KBD_LED_REPORT_ID2) {
> >>
> >>>  +                       return -1;
> >>
> >> is -1 a good return code? (this Q for all cases)

> >>>  +                               ret = asus_wmi_send_event(drvdata, 0xae);
> >>>  +                               if (ret < 0) {
> >>>  +                                       hid_warn(hdev, "Asus failed to trigger fan control event");
> >>>  +                               }
> >>
> >>>  +                               return -1;
> >
> > In the case of this block I really don't have any idea how
> > to handle it. I want to stop these particular keycodes from
> > being evaluated elsewhere. Returning -1 seemed to be the only
> > way to do this, unless my understanding is very incorrect.
> >
> > Any help or guidance on how to handle this is definitely
> > appreciated.
>
> Sorry, I missed that Andy's comment on this where for the raw-event handler,
> in this case -1 has the special meaning of don't process this event further,
> rather then being an error code.

Good to know, thanks!

> So, since in this case -1 has a special meaning and it is NOT an error
> code, using -1 is fine. IOW you can keep this part as is.

I agree with Hans, you may ignore my question in those cases.

-- 
With Best Regards,
Andy Shevchenko
