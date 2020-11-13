Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3ED282B22B8
	for <lists+linux-input@lfdr.de>; Fri, 13 Nov 2020 18:43:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726210AbgKMRni (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 Nov 2020 12:43:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726097AbgKMRnh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 Nov 2020 12:43:37 -0500
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9437EC0617A6
        for <linux-input@vger.kernel.org>; Fri, 13 Nov 2020 09:43:37 -0800 (PST)
Received: by mail-pl1-x642.google.com with SMTP id g11so4859942pll.13
        for <linux-input@vger.kernel.org>; Fri, 13 Nov 2020 09:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=android.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Cxl8X/HuYAqqnrXtUbdxyEhUXeoGgiAFGf9Dpt4A/GQ=;
        b=XzSI+EfFHCu6NXkWq5Jr+3fI3IaEfHaGNFer1Go731uCdMNPQwbmweg2/rS+kOj91Y
         7k1dof770HztDnF4CoXIOk7Rpco/ucI4tyHl10l1s5nhf7MfTbcbb4XFiGsswx5Bnvn5
         eCf9vzzn6Clg1siCDBsJGhvs0xAptg700w2jrtmOLyi1RAKEaG4bOFFLL1Wdk899gj34
         YAlB7u9I6Dj2KdevCGY3qITbJk2Gdt3zLlFaPTqYkMhy0AsqCPdkpDMgRMbJu/csHweF
         QQdsp6EL3NyTWuYaAxbjF9elGVIPu8qdzFtlMOcvxHd9AztuF8VH4jL8Fs1LQ97Bvj55
         TQvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Cxl8X/HuYAqqnrXtUbdxyEhUXeoGgiAFGf9Dpt4A/GQ=;
        b=Epb23isgebsRI/s6uu1MuJerLyBXBywNDDVv3l3q8haJDnWJemjs9GlVTD7x3LWt1C
         RLaJmlJpKGWKIhxd76aMW+pzU/0ezpyrwZkkwhX6fG1N+bTIYtQCc7oqz7ASoa0ZuX1r
         zYYPoYDzOnRXwWYgo0HxONkpx6QTRr9AmaukKyko75vhbNmXVE9FQRPDb/TYBiqpcqga
         RuFJ9xZp2cKiunWfOE3Lha0ffFOs8U1HvA9k5ASmjaQ+J/tZdhprDpqLBtOLuwJO7Spx
         Q0eelDbqHu2lWQE2o1uWn86BZv3RsU0LSBBlybCbQvzwa3aLSKPoSJMNlfQh8Al6S5Wh
         fOKw==
X-Gm-Message-State: AOAM532KHU5FbGX/TyONSbsLXeNHKWI5o92b+V+V1HJFIDcojlwcaQMb
        gjxAl4KtJ6QFEwRsIfXYGue7IO/zeVOoPauBO5z4DA==
X-Google-Smtp-Source: ABdhPJyOi86TRga/jqHfc8BYafx4xQK6HLBAhmrHUjK8NzNFDuQXcuNQv/ZdLylQ0vvoEdv89A5rhnyr710SVHZhwBg=
X-Received: by 2002:a17:902:7043:b029:d6:9d17:44f3 with SMTP id
 h3-20020a1709027043b02900d69d1744f3mr3059245plt.45.1605289412040; Fri, 13 Nov
 2020 09:43:32 -0800 (PST)
MIME-Version: 1.0
References: <20201101193452.678628-1-lzye@google.com> <nycvar.YFH.7.76.2011091255280.18859@cbobk.fhfr.pm>
 <e39fbd02-e691-010c-702d-de86ecfc8854@gmail.com>
In-Reply-To: <e39fbd02-e691-010c-702d-de86ecfc8854@gmail.com>
From:   Michael Wright <michaelwr@android.com>
Date:   Fri, 13 Nov 2020 17:43:20 +0000
Message-ID: <CALDEARh3325ZxQqY58T6imT3QBAkKX_i7ZnuX3PFJ9uQjofozA@mail.gmail.com>
Subject: Re: [PATCH v2] Input: Add devices for HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE
To:     Chris Ye <linzhao.ye@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>, Chris Ye <lzye@google.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Chris,

I believe the patch is applied to the HID tree:
https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/commit/?h=for-5.10/upstream-fixes&id=f59ee399de4a8ca4d7d19cdcabb4b63e94867f09

If so, the commit SHA is f59ee399de4a8ca4d7d19cdcabb4b63e94867f09.

Hope this helps,
Michael


On Fri, Nov 13, 2020 at 5:27 PM Chris Ye <linzhao.ye@gmail.com> wrote:
>
> Hi Jiri,  can I have a commit ID for 5.10? I'll need this to submit the
> patch internally.
>
> Thanks!
>
> Chris
>
> On 11/9/20 3:55 AM, Jiri Kosina wrote:
> > On Sun, 1 Nov 2020, Chris Ye wrote:
> >
> >> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> >> index 74be76e848bf..cf55dca494f3 100644
> >> --- a/drivers/hid/hid-ids.h
> >> +++ b/drivers/hid/hid-ids.h
> >> @@ -449,6 +449,10 @@
> >>   #define USB_VENDOR_ID_FRUCTEL      0x25B6
> >>   #define USB_DEVICE_ID_GAMETEL_MT_MODE      0x0002
> >>
> >> +#define USB_VENDOR_ID_GAMEVICE      0x27F8
> >> +#define USB_DEVICE_ID_GAMEVICE_GV186        0x0BBE
> >> +#define USB_DEVICE_ID_GAMEVICE_KISHI        0x0BBF
> >> +
> >>   #define USB_VENDOR_ID_GAMERON              0x0810
> >>   #define USB_DEVICE_ID_GAMERON_DUAL_PSX_ADAPTOR     0x0001
> >>   #define USB_DEVICE_ID_GAMERON_DUAL_PCS_ADAPTOR     0x0002
> >> diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
> >> index 0440e2f6e8a3..36d94e3485e3 100644
> >> --- a/drivers/hid/hid-quirks.c
> >> +++ b/drivers/hid/hid-quirks.c
> >> @@ -84,6 +84,10 @@ static const struct hid_device_id hid_quirks[] = {
> >>      { HID_USB_DEVICE(USB_VENDOR_ID_FREESCALE, USB_DEVICE_ID_FREESCALE_MX28), HID_QUIRK_NOGET },
> >>      { HID_USB_DEVICE(USB_VENDOR_ID_FUTABA, USB_DEVICE_ID_LED_DISPLAY), HID_QUIRK_NO_INIT_REPORTS },
> >>      { HID_USB_DEVICE(USB_VENDOR_ID_GREENASIA, USB_DEVICE_ID_GREENASIA_DUAL_USB_JOYPAD), HID_QUIRK_MULTI_INPUT },
> >> +    { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_GAMEVICE, USB_DEVICE_ID_GAMEVICE_GV186),
> >> +            HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE },
> >> +    { HID_USB_DEVICE(USB_VENDOR_ID_GAMEVICE, USB_DEVICE_ID_GAMEVICE_KISHI),
> >> +            HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE },
> >>      { HID_USB_DEVICE(USB_VENDOR_ID_HAPP, USB_DEVICE_ID_UGCI_DRIVING), HID_QUIRK_BADPAD | HID_QUIRK_MULTI_INPUT },
> >>      { HID_USB_DEVICE(USB_VENDOR_ID_HAPP, USB_DEVICE_ID_UGCI_FIGHTING), HID_QUIRK_BADPAD | HID_QUIRK_MULTI_INPUT },
> >>      { HID_USB_DEVICE(USB_VENDOR_ID_HAPP, USB_DEVICE_ID_UGCI_FLYING), HID_QUIRK_BADPAD | HID_QUIRK_MULTI_INPUT },
> > Applied for 5.10, thanks.
> >
