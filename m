Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 514FF226FB0
	for <lists+linux-input@lfdr.de>; Mon, 20 Jul 2020 22:26:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729103AbgGTUZC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 Jul 2020 16:25:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727123AbgGTUZB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 Jul 2020 16:25:01 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27C27C061794;
        Mon, 20 Jul 2020 13:25:01 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id 1so9629954pfn.9;
        Mon, 20 Jul 2020 13:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lV6IEO34DQ5QN270Bu39re+3l43e4KkGz76UFGIKMPY=;
        b=S/UyPh1SVbNXyTmocCZYmDKUTj5L9a220+TtVXBficI1O5knNPOcaGC2pXKDFGX51U
         Vps02OhDwXqKhFv2dz9GRcPkCFRiO2ocUfFBW4lFFChHNeLjftmFsrQpio9fJUKHXtuK
         LYPcfswEtbfQAfg+n3WB2SU6IclopRkZWehdj7hMiNjMkJO2Yw7MeyCTmSchBILyhko+
         O9mFWYu6k3kqTmVisfuJyhYuZfddGqb60xAdc/a+UDtBihUdiTKupFhmuoqYwLMUFSXi
         zRnB+L/DmnSkTwjsWQy5R4LD/XnXiQn5Ttgh7GyVfnJsgi1ZfIj4skEKLxtTipGR6SqW
         B7EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lV6IEO34DQ5QN270Bu39re+3l43e4KkGz76UFGIKMPY=;
        b=bL4SlI/5Trj2f1u9EFIJxTr58ewBlLcYU/Nc8RJJlQ1ytEZvE/OwItKsNdmvfPKzEU
         +P0OBPrmGb1hZcf65qzznDS44y3q3Wh5HbeafYBprhmp1WHPKPBqbXXh4gJQzIArEsWl
         vnqrhN4KiAIf6sTVz2q6NOzjG4GKkxTgQrPK56zQyk9VEwpMuSwTMFe4skrJS1CA9W+1
         ZVdAAExKvwSkzBkUp5Zi0cqjBlkM20lF/g6fDqBYsddKpydvoWYBVsQJCkEsGzigleEx
         nyfJrOULSgct2leE/AC/Bq75HoSwfG5IzHQdacShpywVH+1pwtGRdgOkJKhcl4AeO6fm
         BONw==
X-Gm-Message-State: AOAM5318/NdCvQwzOqLxhLY/z8O8qGTpipW2Mf4ALg3+fnztxpuDS0Xj
        00L0b9aFl3P/z9YB2Th0wzqaXvWdB5ceruDAzyfu4MKVqGYaOTxx
X-Google-Smtp-Source: ABdhPJyA5NiuDH5xG/UxH7vPxminMYJd6g32yNQTgAJi8Fay2X98YCRy6kYiQzVCB66lBwoaCg+fuB9uHt+Q1LKEDUs=
X-Received: by 2002:a63:571e:: with SMTP id l30mr20617701pgb.220.1595276700348;
 Mon, 20 Jul 2020 13:25:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200720200916.31082-1-puilp0502@gmail.com>
In-Reply-To: <20200720200916.31082-1-puilp0502@gmail.com>
From:   Frank Yang <puilp0502@gmail.com>
Date:   Tue, 21 Jul 2020 05:24:34 +0900
Message-ID: <CA+rSvc7goy-h-Hu7MruaryngBs39_8oE1AijFAnybuDSiSRHhw@mail.gmail.com>
Subject: Re: [PATCH] HID: Support Varmilo Keyboards' media hotkeys
To:     linux-kernel@vger.kernel.org
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 2020-07-21 at 05:10 +0900, Frank Yang <puilp0502@gmail.com> wrote:
>
> The Varmilo VA104M Keyboard (04b4:07b1, reported as Varmilo Z104M)
> exposes media control hotkeys as a USB HID consumer control device,
> but these keys do not work in the current (5.8-rc1) kernel due to
> the incorrect HID report descriptor. Fix the problem by modifying
> the internal HID report descriptor.
>
> More specifically, the keyboard report descriptor specifies the
> logical boundary as 572~10754 (0x023c ~ 0x2a02) while the usage
> boundary is specified as 0~10754 (0x00 ~ 0x2a02). This results in an
> incorrect interpretation of input reports, causing inputs to be ignored.
> By setting the Logical Minimum to zero, we align the logical boundary
> with the Usage ID boundary.
>
> Some notes:
>
> * There seem to be multiple variants of the VA104M keyboard. This
>   patch specifically targets 04b4:07b1 variant.
>
> * The device works out-of-the-box on Windows platform with the generic
>   consumer control device driver (hidserv.inf). This suggests that
>   Windows either ignores the Logical Minimum/Logical Maximum or
>   interprets the Usage ID assignment differently from the linux
>   implementation; Maybe there are other devices out there that only
>   works on Windows due to this problem?
>
> Signed-off-by: Frank Yang <puilp0502@gmail.com>
> ---
>  drivers/hid/Kconfig       |  6 ++++
>  drivers/hid/Makefile      |  1 +
>  drivers/hid/hid-ids.h     |  2 ++
>  drivers/hid/hid-varmilo.c | 58 +++++++++++++++++++++++++++++++++++++++
>  4 files changed, 67 insertions(+)
>  create mode 100644 drivers/hid/hid-varmilo.c
>
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index 443c5cbbde04..c9f0c9b79158 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -441,6 +441,12 @@ config HID_WALTOP
>         ---help---
>         Support for Waltop tablets.
>
> +config HID_VARMILO
> +       tristate "Varmilo Keyboards"
> +       depends on HID
> +       help
> +         Support for Varmilo keyboards.
> +
>  config HID_VIEWSONIC
>         tristate "ViewSonic/Signotec"
>         depends on HID
> diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
> index d8ea4b8c95af..e90a98090452 100644
> --- a/drivers/hid/Makefile
> +++ b/drivers/hid/Makefile
> @@ -124,6 +124,7 @@ obj-$(CONFIG_HID_LED)               += hid-led.o
>  obj-$(CONFIG_HID_XINMO)                += hid-xinmo.o
>  obj-$(CONFIG_HID_ZEROPLUS)     += hid-zpff.o
>  obj-$(CONFIG_HID_ZYDACRON)     += hid-zydacron.o
> +obj-$(CONFIG_HID_VARMILO)      += hid-varmilo.o
>  obj-$(CONFIG_HID_VIEWSONIC)    += hid-viewsonic.o
>
>  wacom-objs                     := wacom_wac.o wacom_sys.o
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index 874fc3791f3b..955be22fc69d 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -1189,6 +1189,8 @@
>  #define USB_DEVICE_ID_UNITEC_USB_TOUCH_0709    0x0709
>  #define USB_DEVICE_ID_UNITEC_USB_TOUCH_0A19    0x0a19
>
> +#define USB_DEVICE_ID_VARMILO_VA104M_07B1   0X07b1
> +
>  #define USB_VENDOR_ID_VELLEMAN         0x10cf
>  #define USB_DEVICE_ID_VELLEMAN_K8055_FIRST     0x5500
>  #define USB_DEVICE_ID_VELLEMAN_K8055_LAST      0x5503
> diff --git a/drivers/hid/hid-varmilo.c b/drivers/hid/hid-varmilo.c
> new file mode 100644
> index 000000000000..10e50f2dca61
> --- /dev/null
> +++ b/drivers/hid/hid-varmilo.c
> @@ -0,0 +1,58 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + *  HID report fixup for varmilo keyboards
> + *
> + *  Copyright (c) 2020 Frank Yang <puilp0502@gmail.com>
> + *
> + */
> +
> +#include <linux/hid.h>
> +#include <linux/module.h>
> +
> +#include "hid-ids.h"
> +
> +/*
> + * Varmilo VA104M with device ID of 07B1 incorrectly reports Logical Minimum as
> + * 572 (0x02 0x3c). We fix this by setting Logical Minimum to zero.
> + */
> +static __u8 *varmilo_07b1_report_fixup(struct hid_device *hdev, __u8 *rdesc,
> +                                      unsigned int *rsize)
> +{
> +       if (*rsize == 25 &&
> +           rdesc[0] == 0x05 && rdesc[1] == 0x0c &&
> +           rdesc[2] == 0x09 && rdesc[3] == 0x01 &&
> +           rdesc[6] == 0x19 && rdesc[7] == 0x00 &&
> +           rdesc[11] == 0x16 && rdesc[12] == 0x3c && rdesc[13] == 0x02) {
> +               hid_info(hdev,
> +                        "fixing up varmilo VA104M consumer control report descriptor\n");
> +               rdesc[12] = 0x00;
> +               rdesc[13] = 0x00;
> +       }
> +       return rdesc;
> +}
> +
> +static __u8 *varmilo_report_fixup(struct hid_device *hdev, __u8 *rdesc,
> +                                 unsigned int *rsize)
> +{
> +       if (hdev->product == USB_DEVICE_ID_VARMILO_VA104M_07B1 &&
> +           hdev->vendor == USB_VENDOR_ID_CYPRESS)
> +               rdesc = varmilo_07b1_report_fixup(hdev, rdesc, rsize);
> +       return rdesc;
> +}
> +
> +static const struct hid_device_id varmilo_devices[] = {
> +       { HID_USB_DEVICE(USB_VENDOR_ID_CYPRESS, USB_DEVICE_ID_VARMILO_VA104M_07B1) },
> +       {}
> +};
> +
> +MODULE_DEVICE_TABLE(hid, varmilo_devices);
> +
> +static struct hid_driver varmilo_driver = {
> +       .name = "varmilo",
> +       .id_table = varmilo_devices,
> +       .report_fixup = varmilo_report_fixup,
> +};
> +
> +module_hid_driver(varmilo_driver);
> +
> +MODULE_LICENSE("GPL");
> --
> 2.17.1
>
CCing linux-input mailing list.

Cc: linux-input@vger.kernel.org
