Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D88A5CD19
	for <lists+linux-input@lfdr.de>; Tue,  2 Jul 2019 11:59:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726861AbfGBJ7E (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 2 Jul 2019 05:59:04 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:47031 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbfGBJ7E (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 2 Jul 2019 05:59:04 -0400
Received: by mail-qt1-f193.google.com with SMTP id h21so17707978qtn.13
        for <linux-input@vger.kernel.org>; Tue, 02 Jul 2019 02:59:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KD9QNsEaqeq8xoBUFfMjIXVq6bcKY3wLakISSz8vZzE=;
        b=bi2H5QUduxiYgY0vifwTj6f+su7vxoFBCtFob/ZkLZNeO/wBaKPiDwCzBoHO8VF0ht
         bebl5+qiL2rg/wB2lHPe6ZoTQuSiTOxa5azATaIoXU6c1VAPacp+3JSk1jjFMouZBdix
         HyzzKwbdoZ/WHBi3EXGa+6ENqIhzDyFga7NrgrsoOGyz0TqdbjCAtI20HgAz6bO2kgLo
         XSRW1Jw2sRHP1zk0nRrk3eca2d7/IZNlAWrxmqdWDDIyh3smrs9dNTcBtGZ3j4mgf3w5
         HhgpFe+CdS4r915r6hADBpZcKia5d7uxIbalfTv/ZiMS/66TA+/7yI1/yNK5k8QOIZlF
         AQMg==
X-Gm-Message-State: APjAAAXBJWyVSdA/37TUGBTmEKEL8s/got/fsbyG57t7LArwFmCqDw1s
        YULbX97jaTi/JieEdOj3DbuPXWjSO0D9psmrJ3fN6Q==
X-Google-Smtp-Source: APXvYqwjaRyhD1VYbupVexhoW0Vp77rADC01R0w399AgJABSwJI1rDubIoJC6VseLNFnKbUvZ5nuR4Ou22rPyHhLkLE=
X-Received: by 2002:ad4:476f:: with SMTP id d15mr6975144qvx.29.1562061543271;
 Tue, 02 Jul 2019 02:59:03 -0700 (PDT)
MIME-Version: 1.0
References: <1561589328-32520-1-git-send-email-aaron.skomra@wacom.com>
In-Reply-To: <1561589328-32520-1-git-send-email-aaron.skomra@wacom.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 2 Jul 2019 11:58:52 +0200
Message-ID: <CAO-hwJ+o3JB13hnSLmPT35cZ_jt1dMyJ_do-Wb3iwNAt7HhTUQ@mail.gmail.com>
Subject: Re: [PATCH] HID: wacom: generic: add touchring adjustment for 2nd Gen
 Pro Small
To:     Aaron Armstrong Skomra <skomra@gmail.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Ping Cheng <pinglinux@gmail.com>,
        Jason Gerecke <jason.gerecke@wacom.com>,
        Aaron Armstrong Skomra <aaron.skomra@wacom.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jun 27, 2019 at 12:49 AM Aaron Armstrong Skomra
<skomra@gmail.com> wrote:
>
> Add the product ID for the 2nd Generation Intuos Pro
> Small to the touchring coordinate adjustment block.
>
> Signed-off-by: Aaron Armstrong Skomra <aaron.skomra@wacom.com>
> Reviewed-by: Ping Cheng <ping.cheng@wacom.com>
> ---

Applied to for-5.3/wacom

Cheers,
Benjamin

>  drivers/hid/wacom_wac.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
> index e35d04451595..35942bba5390 100644
> --- a/drivers/hid/wacom_wac.c
> +++ b/drivers/hid/wacom_wac.c
> @@ -2029,10 +2029,12 @@ static void wacom_wac_pad_event(struct hid_device *hdev, struct hid_field *field
>                 if (hdev->vendor == 0x56a &&
>                     (hdev->product == 0x34d || hdev->product == 0x34e ||  /* MobileStudio Pro */
>                      hdev->product == 0x357 || hdev->product == 0x358 ||  /* Intuos Pro 2 */
> +                    hdev->product == 0x392 ||                            /* Intuos Pro 2 */
>                      hdev->product == 0x399)) {                           /* MobileStudio Pro */
>                         value = (field->logical_maximum - value);
>
> -                       if (hdev->product == 0x357 || hdev->product == 0x358)
> +                       if (hdev->product == 0x357 || hdev->product == 0x358 ||
> +                           hdev->product == 0x392)
>                                 value = wacom_offset_rotation(input, usage, value, 3, 16);
>                         else if (hdev->product == 0x34d || hdev->product == 0x34e ||
>                                  hdev->product == 0x399)
> --
> 2.17.1
>
