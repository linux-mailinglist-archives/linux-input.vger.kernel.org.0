Return-Path: <linux-input+bounces-7093-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F97E9914FE
	for <lists+linux-input@lfdr.de>; Sat,  5 Oct 2024 08:54:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7F084B21E73
	for <lists+linux-input@lfdr.de>; Sat,  5 Oct 2024 06:54:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30D0F75809;
	Sat,  5 Oct 2024 06:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ECcCMxDp"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6581224D6;
	Sat,  5 Oct 2024 06:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728111289; cv=none; b=jHt2ymdjDHJhGmoVmH3l3fx53nXg6GT875EPDdxsNdyWYEv0W16siLht0uoiemFyZosL2uEeISW7pLQxbgg/dsmx6DeZS8ayMAq0afaI7qkjvCXkcfJhR9sAKn/h4q7OexEVrRBXWtzH/9wm1HV8AKAHmHCF8dha8nHBVZXq1eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728111289; c=relaxed/simple;
	bh=HIid5GpJwJmEo0oOw+0u8cj9NrEY3zXUFGZ4Tspovek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=trBlb9O6AgZzpdofTkvHWbr8ErIXivRQpj6tdyYmsJeD/wJHAaIEj1JkvID1NaTofMtGBRYOXv9kXlQ/y92nIW+GPZ1Br7URdx60ZcS7zXyOJaqtST2eE0G19Tfi4/RRsXQMSs4L5gORvTToTOX0328ATs+HnYh6C6XeL4/6W04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ECcCMxDp; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2e0a74ce880so2441848a91.2;
        Fri, 04 Oct 2024 23:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728111286; x=1728716086; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AljMS4Gs1jWTNHbry55vak67gQTle+vZKJGqrGggBcg=;
        b=ECcCMxDp4MLGZrK5yIlSIjUzzykV9fMk+4BLQV1qumI/7/jlZhGZ90VgTw8ip55D+F
         5ftZt8dd7DbSH+jCO9JOIbDk8IuHEaA2tkBVk6Ng+1/AY49GVdI+LpITjR5WphDr3rzM
         CDWLnMQgDsnyeCmeX0ekIJB6NSQuZ5sOZ9dk7Jciumf7DPxfMhnNKPaOYx2iIVpr7rkK
         yOPF6k8owonhqcXTF3FIS/rh+p7kHqoMqA4M5umvaOG9rbgq3T+mD2oCsGq7C+FWZm0g
         NYcULSSJC7WzAjrU9rEEb3ZgVjgd9ot0l2niyQhjpK7jbWZ5So7pBYaak2C3RQh3d9yP
         TYJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728111286; x=1728716086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AljMS4Gs1jWTNHbry55vak67gQTle+vZKJGqrGggBcg=;
        b=FktvSudK77uCR10qjgEj1ltE+climNppLL3mfMo3MW79fRzl4FM7FfPkbcyjThpY2J
         44476UY7O7l2pg7TFcs5gHKCYyRl0+e9ppDUJTtDqu+FavBTWlczkRlrRGoAL/ETJCqd
         dnqMatbQAFZhrOQOwf1fRfnhD/6lFMbpasIKSoU/jNGfOo0qCIU02uApqC94lzgYJYjv
         KsAfrK4+m7jsjpe4JFRh4pOAZowNq38KqIuSgGL5Td7OWrgNPAA8xHKKbzr73sXxEmCx
         jfon6W6mBLdZ6lF661wK8o81Dp61M7kJvqzX1zxnQVjZAs95Sure6Mh1GbS2fLw2UGei
         clDw==
X-Forwarded-Encrypted: i=1; AJvYcCWIRTrzeOja5EAtxI+sP72rzFjeP7Hrxl0kFdJqT89L1PN1fbza+S5RN/hfq6b0NZApDrXFjBPYZb0JDg==@vger.kernel.org, AJvYcCXwWIA7i/NqV/cSG0EM4Dp0CEz461XQBt5R2D3ufStY6uCu/H/+htDLHYdi++6/IbUF82f7Y+6uhZb0x8Xh@vger.kernel.org
X-Gm-Message-State: AOJu0YyZTOseLSJhNzvAD8/V/y7I4K8MzGn4fDSutDoG4+WGyxH7AhT5
	suId/ch4CSmiqZ6NiFQVz+EpxrIsIm++fVA0G6zRnpGPEyY4vTOx/P50vgtIovgFFvCtelc9FMm
	mgV6glwNgObQNcoSUOuJpIf9hTI6tqizyzuM=
X-Google-Smtp-Source: AGHT+IFfjyD8r0nawYgvxYtjzrGOejJViI2wO84zJF4nj3+7LXjAHkqp80LLFUEW/EZH4a9Gt0gXyKZCrOmTlflyUAQ=
X-Received: by 2002:a17:90b:3851:b0:2e0:94da:bfd2 with SMTP id
 98e67ed59e1d1-2e1e620ea98mr6512946a91.8.1728111285888; Fri, 04 Oct 2024
 23:54:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241003095124.7611-1-vishnuocv@gmail.com> <fmirfyqbkuyxnvb3nqdp35x4uovlg3d546g2z4mi3yjdqbgqtj@qk62ds53ozvo>
In-Reply-To: <fmirfyqbkuyxnvb3nqdp35x4uovlg3d546g2z4mi3yjdqbgqtj@qk62ds53ozvo>
From: Vishnu Sankar <vishnuocv@gmail.com>
Date: Sat, 5 Oct 2024 15:54:09 +0900
Message-ID: <CABxCQKszMMehG=qwszk1+xopmNiYrjNd4pBh3P6dun-ywKppCA@mail.gmail.com>
Subject: Re: [PATCH] hid-lenovo: Support for TP-X12-TAB-1/2 Kbd Fn keys that
 use HID raw events.
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: jikos@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mpearson-lenovo@squebb.ca, vsankar@lenovo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks a lot for the comments.

On Fri, Oct 4, 2024 at 4:38=E2=80=AFPM Benjamin Tissoires <bentiss@kernel.o=
rg> wrote:
>
>
> IIRC, we already saw a previous version of this patch on the list. So
> you are missing a v2, and the changelog after the first "---".
Acknowledged.
>
> All in all, the subject should be:
> [PATCH v2] HID: lenovo: Support for TP-X12-TAB-1/2 Kbd Fn keys
>
> (dropped the "that use HID raw events" to make it more concise, and
> split hid-lenovo into "HID: lenovo").
Acknowledged.
>
> If you are happy with my remarks below, please send a v3 with the
> subject following the pattern from above.
Acknowledged.
>
> On Oct 03 2024, Vishnu Sankar wrote:
> > Fn Keys like Mic mute, Power Modes/Airplane mode,Selective
> > screenshot/Pickup Phone, KBD Backlight, Display mode and
> > star/Favourites is emitted as HID raw events in X12 Tab1 and Tab2.
> > This support has been added.
> >
> > Thinkpad X12 TAB 2 and TAB 1 Folio keyboard's raw events will get
> > detected as Fn keys with this patch.
> >
> > Default fn_lock state for these Keyboards are OFF.
> >
> > Other than these changes, we follow TP10UKBD's processes.
> >
> > Tested on X12 Tab 2.
> >
> > Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
> > Signed-off-by: Vishnu Sankar <vsankar@lenovo.com>
> > Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> > ---
> >  drivers/hid/hid-lenovo.c | 122 ++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 121 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
> > index 3b0c779ce8f7..86ce6152429d 100644
> > --- a/drivers/hid/hid-lenovo.c
> > +++ b/drivers/hid/hid-lenovo.c
> > @@ -31,12 +31,21 @@
> >  #include <linux/input.h>
> >  #include <linux/leds.h>
> >  #include <linux/workqueue.h>
> > +#include <linux/platform_profile.h>
> >
> >  #include "hid-ids.h"
> >
> >  /* Userspace expects F20 for mic-mute KEY_MICMUTE does not work */
> >  #define LENOVO_KEY_MICMUTE KEY_F20
> >
> > +/* HID raw events for ThinkPas X12 Tabs*/
> > +#define TP_X12_RAW_HOTKEY_FN_F4              0x000200
> > +#define TP_X12_RAW_HOTKEY_FN_F8              0x100038
> > +#define TP_X12_RAW_HOTKEY_FN_F10     0x080000
> > +#define TP_X12_RAW_HOTKEY_FN_F12     0x040000
> > +#define TP_X12_RAW_HOTKEY_FN_SPACE   0x100018
> > +#define TP_X12_RAW_HOTKEY_FN_F7              0x080013
> > +
> >  struct lenovo_drvdata {
> >       u8 led_report[3]; /* Must be first for proper alignment */
> >       int led_state;
> > @@ -71,6 +80,14 @@ struct lenovo_drvdata {
> >  #define TP10UBKBD_LED_OFF            1
> >  #define TP10UBKBD_LED_ON             2
> >
> > +/* Function to report raw_events as key events*/
> > +static inline void report_key_event(struct input_dev *input, int keyco=
de)
> > +{
> > +     input_report_key(input, keycode, 1);
> > +     input_report_key(input, keycode, 0);
> > +     input_sync(input);
> > +}
> > +
> >  static int lenovo_led_set_tp10ubkbd(struct hid_device *hdev, u8 led_co=
de,
> >                                   enum led_brightness value)
> >  {
> > @@ -472,6 +489,8 @@ static int lenovo_input_mapping(struct hid_device *=
hdev,
> >       case USB_DEVICE_ID_LENOVO_TP10UBKBD:
> >               return lenovo_input_mapping_tp10_ultrabook_kbd(hdev, hi, =
field,
> >                                                              usage, bit=
, max);
> > +     case USB_DEVICE_ID_LENOVO_X12_TAB:
> > +     case USB_DEVICE_ID_LENOVO_X12_TAB2:
> >       case USB_DEVICE_ID_LENOVO_X1_TAB:
> >               return lenovo_input_mapping_x1_tab_kbd(hdev, hi, field, u=
sage, bit, max);
> >       default:
> > @@ -581,6 +600,8 @@ static ssize_t attr_fn_lock_store(struct device *de=
v,
> >       case USB_DEVICE_ID_LENOVO_TPIIBTKBD:
> >               lenovo_features_set_cptkbd(hdev);
> >               break;
> > +     case USB_DEVICE_ID_LENOVO_X12_TAB:
> > +     case USB_DEVICE_ID_LENOVO_X12_TAB2:
> >       case USB_DEVICE_ID_LENOVO_TP10UBKBD:
> >       case USB_DEVICE_ID_LENOVO_X1_TAB:
> >               ret =3D lenovo_led_set_tp10ubkbd(hdev, TP10UBKBD_FN_LOCK_=
LED, value);
> > @@ -678,9 +699,63 @@ static const struct attribute_group lenovo_attr_gr=
oup_cptkbd =3D {
> >       .attrs =3D lenovo_attributes_cptkbd,
> >  };
> >
> > +/* Function to handle Lenovo Thinkpad TAB X12's HID raw inputs for fn =
keys*/
> > +static int lenovo_raw_event_TP_X12_tab(struct hid_device *hdev, u32 ra=
w_data)
> > +{
> > +     struct hid_input *hidinput;
> > +     struct input_dev *input =3D NULL;
> > +
> > +     /* Iterate through the associated inputs to find the correct inpu=
t device */
> > +     list_for_each_entry(hidinput, &hdev->inputs, list) {
> > +             input =3D hidinput->input;
> > +             if (input)
> > +                     break;  /* Use the first valid input device */
> > +     }
> > +
> > +     switch (raw_data) {
> > +             /* fn-F20 being used here for MIC mute*/
> > +     case TP_X12_RAW_HOTKEY_FN_F4:
> > +             report_key_event(input, LENOVO_KEY_MICMUTE);
>
> Now I'm puzzled: you are reporting in this function keys that you never
> declared in the input device.
>
> So how can you get the events in userspace, they should be filtered out
> by the input stack?

As per my testing all the events are reaching user space and the fn
keys are also working.

>
> This applies to all the reported keys from here.
>
> Are you sure using raw events is the correct approach?

Open to discussion. It would be helpful if you can guide me with
alternatives, if any.
As per the data sheet, it should be taken as hid raw events and AFAIK
Windows also use hid raw events.

>
> Also, in other words: could you please share a full hid-recorder output
> of the device when you press the keys so I understand where the events
> are mapped?
>
Please find the full hid-recorder output.

$ sudo ./hid-recorder
Available devices:
/dev/hidraw0:    Darfon ThinkPad X12 Detachable Gen 2 Folio Keyboard
/dev/hidraw1:    Darfon ThinkPad X12 Detachable Gen 2 Folio Keyboard
/dev/hidraw2:    Darfon ThinkPad X12 Detachable Gen 2 Folio Keyboard
/dev/hidraw3:    Darfon ThinkPad X12 Detachable Gen 2 Folio Keyboard
/dev/hidraw4:    hid-ishtp 8087:0AC2
/dev/hidraw5:    WACF2200:00 056A:53A3
/dev/hidraw6:    hid-ishtp 8087:0AC2
Select the device event number [0-6]: 1
# Darfon ThinkPad X12 Detachable Gen 2 Folio Keyboard
# 0x05, 0x01,                    // Usage Page (Generic Desktop)        0
# 0x09, 0x02,                    // Usage (Mouse)                       2
# 0xa1, 0x01,                    // Collection (Application)            4
# 0x85, 0x01,                    //  Report ID (1)                      6
# 0x09, 0x01,                    //  Usage (Pointer)                    8
# 0xa1, 0x00,                    //  Collection (Physical)              10
# 0x05, 0x09,                    //   Usage Page (Button)               12
# 0x15, 0x00,                    //   Logical Minimum (0)               14
# 0x25, 0x01,                    //   Logical Maximum (1)               16
# 0x19, 0x01,                    //   Usage Minimum (1)                 18
# 0x29, 0x05,                    //   Usage Maximum (5)                 20
# 0x75, 0x01,                    //   Report Size (1)                   22
# 0x95, 0x05,                    //   Report Count (5)                  24
# 0x81, 0x02,                    //   Input (Data,Var,Abs)              26
# 0x95, 0x03,                    //   Report Count (3)                  28
# 0x81, 0x01,                    //   Input (Cnst,Arr,Abs)              30
# 0x05, 0x01,                    //   Usage Page (Generic Desktop)      32
# 0x16, 0x01, 0x80,              //   Logical Minimum (-32767)          34
# 0x26, 0xff, 0x7f,              //   Logical Maximum (32767)           37
# 0x09, 0x30,                    //   Usage (X)                         40
# 0x09, 0x31,                    //   Usage (Y)                         42
# 0x75, 0x10,                    //   Report Size (16)                  44
# 0x95, 0x02,                    //   Report Count (2)                  46
# 0x81, 0x06,                    //   Input (Data,Var,Rel)              48
# 0x15, 0x81,                    //   Logical Minimum (-127)            50
# 0x25, 0x7f,                    //   Logical Maximum (127)             52
# 0x09, 0x38,                    //   Usage (Wheel)                     54
# 0x75, 0x08,                    //   Report Size (8)                   56
# 0x95, 0x01,                    //   Report Count (1)                  58
# 0x81, 0x06,                    //   Input (Data,Var,Rel)              60
# 0x05, 0x0c,                    //   Usage Page (Consumer Devices)     62
# 0x0a, 0x38, 0x02,              //   Usage (AC Pan)                    64
# 0x95, 0x01,                    //   Report Count (1)                  67
# 0x81, 0x06,                    //   Input (Data,Var,Rel)              69
# 0xc0,                          //  End Collection                     71
# 0xc0,                          // End Collection                      72
# 0x05, 0x01,                    // Usage Page (Generic Desktop)        73
# 0x09, 0x80,                    // Usage (System Control)              75
# 0xa1, 0x01,                    // Collection (Application)            77
# 0x85, 0x02,                    //  Report ID (2)                      79
# 0x19, 0x81,                    //  Usage Minimum (129)                81
# 0x29, 0x83,                    //  Usage Maximum (131)                83
# 0x15, 0x00,                    //  Logical Minimum (0)                85
# 0x25, 0x01,                    //  Logical Maximum (1)                87
# 0x75, 0x01,                    //  Report Size (1)                    89
# 0x95, 0x03,                    //  Report Count (3)                   91
# 0x81, 0x02,                    //  Input (Data,Var,Abs)               93
# 0x95, 0x05,                    //  Report Count (5)                   95
# 0x81, 0x01,                    //  Input (Cnst,Arr,Abs)               97
# 0xc0,                          // End Collection                      99
# 0x05, 0x0c,                    // Usage Page (Consumer Devices)       100
# 0x09, 0x01,                    // Usage (Consumer Control)            102
# 0xa1, 0x01,                    // Collection (Application)            104
# 0x85, 0x03,                    //  Report ID (3)                      106
# 0x19, 0x00,                    //  Usage Minimum (0)                  108
# 0x2a, 0xff, 0x07,              //  Usage Maximum (2047)               110
# 0x15, 0x00,                    //  Logical Minimum (0)                113
# 0x26, 0xff, 0x07,              //  Logical Maximum (2047)             115
# 0x95, 0x01,                    //  Report Count (1)                   118
# 0x75, 0x18,                    //  Report Size (24)                   120
# 0x81, 0x00,                    //  Input (Data,Arr,Abs)               122
# 0xc0,                          // End Collection                      124
# 0x05, 0x01,                    // Usage Page (Generic Desktop)        125
# 0x09, 0x06,                    // Usage (Keyboard)                    127
# 0xa1, 0x01,                    // Collection (Application)            129
# 0x85, 0x04,                    //  Report ID (4)                      131
# 0x05, 0x07,                    //  Usage Page (Keyboard)              133
# 0x95, 0x01,                    //  Report Count (1)                   135
# 0x75, 0x08,                    //  Report Size (8)                    137
# 0x81, 0x03,                    //  Input (Cnst,Var,Abs)               139
# 0x95, 0xe8,                    //  Report Count (232)                 141
# 0x75, 0x01,                    //  Report Size (1)                    143
# 0x15, 0x00,                    //  Logical Minimum (0)                145
# 0x25, 0x01,                    //  Logical Maximum (1)                147
# 0x05, 0x07,                    //  Usage Page (Keyboard)              149
# 0x19, 0x00,                    //  Usage Minimum (0)                  151
# 0x29, 0xe7,                    //  Usage Maximum (231)                153
# 0x81, 0x00,                    //  Input (Data,Arr,Abs)               155
# 0xc0,                          // End Collection                      157
# 0x05, 0x01,                    // Usage Page (Generic Desktop)        158
# 0x09, 0x0c,                    // Usage (Wireless Radio Controls)     160
# 0xa1, 0x01,                    // Collection (Application)            162
# 0x85, 0x08,                    //  Report ID (8)                      164
# 0x15, 0x00,                    //  Logical Minimum (0)                166
# 0x25, 0x01,                    //  Logical Maximum (1)                168
# 0x09, 0xc6,                    //  Usage (Wireless Radio Button)      170
# 0x95, 0x01,                    //  Report Count (1)                   172
# 0x75, 0x01,                    //  Report Size (1)                    174
# 0x81, 0x06,                    //  Input (Data,Var,Rel)               176
# 0x75, 0x07,                    //  Report Size (7)                    178
# 0x81, 0x03,                    //  Input (Cnst,Var,Abs)               180
# 0xc0,                          // End Collection                      182
# 0x06, 0xa0, 0xff,              // Usage Page (Vendor Usage Page 0xffa0) 1=
83
# 0x09, 0x01,                    // Usage (Vendor Usage 0x01)           186
# 0xa1, 0x01,                    // Collection (Application)            188
# 0x85, 0x09,                    //  Report ID (9)                      190
# 0x09, 0x01,                    //  Usage (Vendor Usage 0x01)          192
# 0x75, 0x08,                    //  Report Size (8)                    194
# 0x95, 0x02,                    //  Report Count (2)                   196
# 0x91, 0x82,                    //  Output (Data,Var,Abs,Vol)          198
# 0x09, 0x02,                    //  Usage (Vendor Usage 0x02)          200
# 0x75, 0x08,                    //  Report Size (8)                    202
# 0x95, 0x02,                    //  Report Count (2)                   204
# 0x81, 0x82,                    //  Input (Data,Var,Abs,Vol)           206
# 0xc0,                          // End Collection                      208
# 0x06, 0xa1, 0xff,              // Usage Page (Vendor Usage Page 0xffa1) 2=
09
# 0x09, 0x11,                    // Usage (Vendor Usage 0x11)           212
# 0xa1, 0x01,                    // Collection (Application)            214
# 0x85, 0x54,                    //  Report ID (84)                     216
# 0x09, 0x11,                    //  Usage (Vendor Usage 0x11)          218
# 0x75, 0x08,                    //  Report Size (8)                    220
# 0x95, 0x01,                    //  Report Count (1)                   222
# 0xb1, 0x02,                    //  Feature (Data,Var,Abs)             224
# 0xc0,                          // End Collection                      226
# 0x06, 0xa3, 0xff,              // Usage Page (Vendor Usage Page 0xffa3) 2=
27
# 0x09, 0x13,                    // Usage (Vendor Usage 0x13)           230
# 0xa1, 0x01,                    // Collection (Application)            232
# 0x85, 0x74,                    //  Report ID (116)                    234
# 0x09, 0x13,                    //  Usage (Vendor Usage 0x13)          236
# 0x75, 0x08,                    //  Report Size (8)                    238
# 0x95, 0x01,                    //  Report Count (1)                   240
# 0xb1, 0x02,                    //  Feature (Data,Var,Abs)             242
# 0xc0,                          // End Collection                      244
# 0x06, 0xa2, 0xff,              // Usage Page (Vendor Usage Page 0xffa2) 2=
45
# 0x09, 0x12,                    // Usage (Vendor Usage 0x12)           248
# 0xa1, 0x01,                    // Collection (Application)            250
# 0x85, 0x64,                    //  Report ID (100)                    252
# 0x09, 0x12,                    //  Usage (Vendor Usage 0x12)          254
# 0x75, 0x08,                    //  Report Size (8)                    256
# 0x95, 0x01,                    //  Report Count (1)                   258
# 0xb1, 0x02,                    //  Feature (Data,Var,Abs)             260
# 0xc0,                          // End Collection                      262
# 0x06, 0xa6, 0xff,              // Usage Page (Vendor Usage Page 0xffa6) 2=
63
# 0x09, 0x16,                    // Usage (Vendor Usage 0x16)           266
# 0xa1, 0x01,                    // Collection (Application)            268
# 0x85, 0xb4,                    //  Report ID (180)                    270
# 0x09, 0x16,                    //  Usage (Vendor Usage 0x16)          272
# 0x75, 0x08,                    //  Report Size (8)                    274
# 0x95, 0x01,                    //  Report Count (1)                   276
# 0xb1, 0x02,                    //  Feature (Data,Var,Abs)             278
# 0xc0,                          // End Collection                      280
# 0x06, 0xa8, 0xff,              // Usage Page (Vendor Usage Page 0xffa8) 2=
81
# 0x09, 0x18,                    // Usage (Vendor Usage 0x18)           284
# 0xa1, 0x01,                    // Collection (Application)            286
# 0x85, 0xc4,                    //  Report ID (196)                    288
# 0x09, 0x18,                    //  Usage (Vendor Usage 0x18)          290
# 0x75, 0x08,                    //  Report Size (8)                    292
# 0x95, 0x01,                    //  Report Count (1)                   294
# 0xb1, 0x02,                    //  Feature (Data,Var,Abs)             296
# 0xc0,                          // End Collection                      298
#
R: 299 05 01 09 02 a1 01 85 01 09 01 a1 00 05 09 15 00 25 01 19 01 29
05 75 01 95 05 81 02 95 03 81 01 05 01 16 01 80 26 ff 7f 09 30 09 31
75 10 95 02 81 06 15 81 25 7f 09 38 75 08 95 01 81 06 05 0c 0a 38 02
95 01 81 06 c0 c0 05 01 09 80 a1 01 85 02 19 81 29 83 15 00 25 01 75
01 95 03 81 02 95 05 81 01 c0 05 0c 09 01 a1 01 85 03 19 00 2a ff 07
15 00 26 ff 07 95 01 75 18 81 00 c0 05 01 09 06 a1 01 85 04 05 07 95
01 75 08 81 03 95 e8 75 01 15 00 25 01 05 07 19 00 29 e7 81 00 c0 05
01 09 0c a1 01 85 08 15 00 25 01 09 c6 95 01 75 01 81 06 75 07 81 03
c0 06 a0 ff 09 01 a1 01 85 09 09 01 75 08 95 02 91 82 09 02 75 08 95
02 81 82 c0 06 a1 ff 09 11 a1 01 85 54 09 11 75 08 95 01 b1 02 c0 06
a3 ff 09 13 a1 01 85 74 09 13 75 08 95 01 b1 02 c0 06 a2 ff 09 12 a1
01 85 64 09 12 75 08 95 01 b1 02 c0 06 a6 ff 09 16 a1 01 85 b4 09 16
75 08 95 01 b1 02 c0 06 a8 ff 09 18 a1 01 85 c4 09 18 75 08 95 01 b1
02 c0
N: Darfon ThinkPad X12 Detachable Gen 2 Folio Keyboard
I: 3 17ef 61ae
# ReportID: 3 /Consumer Devices ['Generic GUIApplication Controls']
E: 000000.000000 4 03 00 02 00
# ReportID: 3 /Consumer Devices ['0xc0000']
E: 000000.132007 4 03 00 00 00
# ReportID: 3 /Consumer Devices ['Generic GUIApplication Controls']
E: 000009.547181 4 03 00 02 00
# ReportID: 3 /Consumer Devices ['0xc0000']
E: 000009.634834 4 03 00 00 00
# ReportID: 3 /Consumer Devices ['0xc0008']
E: 000014.439367 4 03 08 00 00
# ReportID: 3 /Consumer Devices ['0xc0000']
E: 000014.623384 4 03 00 00 00
# ReportID: 3 /Consumer Devices []
E: 000019.087751 4 03 10 00 37
# ReportID: 3 /Consumer Devices ['0xc0000']
E: 000019.311717 4 03 00 00 00
# ReportID: 3 /Consumer Devices ['Microphone']
E: 000019.951779 4 03 04 00 00
# ReportID: 3 /Consumer Devices ['0xc0000']
E: 000020.107736 4 03 00 00 00
# ReportID: 3 /Consumer Devices ['0xc0008']
E: 000025.516053 4 03 08 00 00
# ReportID: 3 /Consumer Devices ['0xc0000']
E: 000025.656104 4 03 00 00 00
# ReportID: 3 /Consumer Devices ['Generic GUIApplication Controls']
E: 000056.272830 4 03 00 02 00
# ReportID: 3 /Consumer Devices ['0xc0000']
E: 000056.404601 4 03 00 00 00
# ReportID: 3 /Consumer Devices []
E: 000060.665584 4 03 10 00 38
# ReportID: 3 /Consumer Devices ['0xc0000']
E: 000060.852819 4 03 00 00 00
# ReportID: 3 /Consumer Devices ['Microphone']
E: 000069.436756 4 03 04 00 00
# ReportID: 3 /Consumer Devices ['0xc0000']
E: 000069.500424 4 03 00 00 00
# ReportID: 3 /Consumer Devices ['Microphone']
E: 000073.176694 4 03 04 00 00
# ReportID: 3 /Consumer Devices ['0xc0000']
E: 000073.288663 4 03 00 00 00
# ReportID: 3 /Consumer Devices []
E: 000082.328406 4 03 10 00 37
# ReportID: 3 /Consumer Devices ['0xc0000']
E: 000082.460400 4 03 00 00 00
# ReportID: 3 /Consumer Devices ['0xc0008']
E: 000084.784371 4 03 08 00 00
# ReportID: 3 /Consumer Devices ['0xc0000']
E: 000084.944337 4 03 00 00 00
# ReportID: 3 /Consumer Devices []
E: 000088.721089 4 03 10 00 38
# ReportID: 3 /Consumer Devices ['0xc0000']
E: 000088.848242 4 03 00 00 00
# ReportID: 3 /Consumer Devices ['Generic GUIApplication Controls']
E: 000091.423969 4 03 00 02 00
# ReportID: 3 /Consumer Devices ['0xc0000']
E: 000091.539696 4 03 00 00 00

HID recorder is showing Keys differently. ( for eg: F8 key, Which is
power profile manager / Airplane mode based on the device ID is not
detected). Is this something to do with my implementation?
.

> > +             return 1;
> > +             /* Power-mode or Airplane mode will be called based on th=
e device*/
> > +     case TP_X12_RAW_HOTKEY_FN_F8:
> > +             /*
> > +              * TP X12 TAB uses Fn-F8 calls Airplanemode
> > +              * Whereas TP X12 TAB2 uses Fn-F8 for toggling
> > +              * Power modes
> > +              */
> > +             (hdev->product =3D=3D USB_DEVICE_ID_LENOVO_X12_TAB) ?
> > +                     report_key_event(input, KEY_RFKILL) :
> > +                     platform_profile_cycle();
> > +             return 1;
> > +     case TP_X12_RAW_HOTKEY_FN_F10:
> > +             /* TAB1 has PICKUP Phone and TAB2 use Snipping tool*/
> > +             (hdev->product =3D=3D USB_DEVICE_ID_LENOVO_X12_TAB) ?
> > +             report_key_event(input, KEY_PICKUP_PHONE) :
> > +             report_key_event(input, KEY_SELECTIVE_SCREENSHOT);
> > +             return 1;
> > +     case TP_X12_RAW_HOTKEY_FN_F12:
> > +             /* BookMarks/STAR key*/
> > +             report_key_event(input, KEY_BOOKMARKS);
> > +             return 1;
> > +     case TP_X12_RAW_HOTKEY_FN_SPACE:
> > +             /* Keyboard LED backlight toggle*/
> > +             report_key_event(input, KEY_KBDILLUMTOGGLE);
> > +             return 1;
> > +     case TP_X12_RAW_HOTKEY_FN_F7:
> > +             /* DISPLAY switching when connecting to external monitors=
*/
> > +             report_key_event(input, KEY_SWITCHVIDEOMODE);
> > +             return 1;
> > +     default:
> > +             break;
> > +     }
> > +     return 0;
> > +}
> > +
> >  static int lenovo_raw_event(struct hid_device *hdev,
> >                       struct hid_report *report, u8 *data, int size)
> >  {
> > +     u32 raw_data;
> >       /*
> >        * Compact USB keyboard's Fn-F12 report holds down many other key=
s, and
> >        * its own key is outside the usage page range. Remove extra
> > @@ -695,6 +770,32 @@ static int lenovo_raw_event(struct hid_device *hde=
v,
> >               data[2] =3D 0x01;
> >       }
> >
> > +     /*
> > +      * Lenovo TP X12 Tab KBD's Fn+XX is HID raw data defined. Report =
ID is 0x03
> > +      * For eg: Raw data received for MIC mute is 0x03000200.
> > +      */
> > +     if (unlikely((hdev->product =3D=3D USB_DEVICE_ID_LENOVO_X12_TAB
> > +                     || hdev->product =3D=3D USB_DEVICE_ID_LENOVO_X12_=
TAB2)
> > +                     && size >=3D 3)) {
> > +             /*
> > +              * data[0] is report ID and is same for all 4byte raw_eve=
nts from this KBD
> > +              * for eg: Fn+F8 0x03,0x10,0x00,0x38
> > +              * report ID here for most of the keys are 0x03.
> > +              */
> > +             if (report->id =3D=3D 0x03)
> > +                     raw_data =3D (data[1] << 16) | (data[2] << 8) | d=
ata[3];
> > +             /*
> > +              * For some Keys the raw data is 6 bytes long but the las=
t 3 bytes
> > +              * will be always Zeros. There is no report-id documented=
.
> > +              * For eg: for Fn+F7: 0x08,0x00,0x13,0x00,0x00,0x00.
> > +              * In other words the last 3 bytes are dummy for now.
> > +              */
> > +             else
> > +                     raw_data =3D (data[0] << 16) | (data[1] << 8) | d=
ata[2];
>
> This seems error prone: in one case you takes bytes 1-3, and the other
> 0-2.
> Why not using all the time 0-4, and change your #defines?
>
> Plus using 4 bytes means you can use le32_to_cpu(data) directly (if I'm
> not wrong).
>
> Which also means that raw_data can be skipped entirely with the
> following below:
>
> lenovo_raw_event_TP_X12_tab(hdev, le32_to_cpu(data));

Understood and acknowledged.
I will test using le32_to_cpu(data) function.

>
> > +
> > +             /* Calling function to generate Key events */
> > +             lenovo_raw_event_TP_X12_tab(hdev, raw_data);
> > +     }
> >       return 0;
> >  }
> >
> > @@ -774,6 +875,8 @@ static int lenovo_event(struct hid_device *hdev, st=
ruct hid_field *field,
> >       case USB_DEVICE_ID_LENOVO_TPIIUSBKBD:
> >       case USB_DEVICE_ID_LENOVO_TPIIBTKBD:
> >               return lenovo_event_cptkbd(hdev, field, usage, value);
> > +     case USB_DEVICE_ID_LENOVO_X12_TAB:
> > +     case USB_DEVICE_ID_LENOVO_X12_TAB2:
> >       case USB_DEVICE_ID_LENOVO_TP10UBKBD:
> >       case USB_DEVICE_ID_LENOVO_X1_TAB:
> >               return lenovo_event_tp10ubkbd(hdev, field, usage, value);
> > @@ -1054,6 +1157,8 @@ static int lenovo_led_brightness_set(struct led_c=
lassdev *led_cdev,
> >       case USB_DEVICE_ID_LENOVO_TPKBD:
> >               lenovo_led_set_tpkbd(hdev);
> >               break;
> > +     case USB_DEVICE_ID_LENOVO_X12_TAB:
> > +     case USB_DEVICE_ID_LENOVO_X12_TAB2:
> >       case USB_DEVICE_ID_LENOVO_TP10UBKBD:
> >       case USB_DEVICE_ID_LENOVO_X1_TAB:
> >               ret =3D lenovo_led_set_tp10ubkbd(hdev, tp10ubkbd_led[led_=
nr], value);
> > @@ -1239,8 +1344,15 @@ static int lenovo_probe_tp10ubkbd(struct hid_dev=
ice *hdev)
> >        * We cannot read the state, only set it, so we force it to on he=
re
> >        * (which should be a no-op) to make sure that our state matches =
the
> >        * keyboard's FN-lock state. This is the same as what Windows doe=
s.
> > +      *
> > +      * For X12 TAB and TAB2, the default windows behavious Fn-lock Of=
f.
> > +      * Adding additional check to ensure the behaviour in case of
> > +      * Thinkpad X12 Tabs.
> >        */
> > -     data->fn_lock =3D true;
> > +
> > +     data->fn_lock =3D !(hdev->product =3D=3D USB_DEVICE_ID_LENOVO_X12=
_TAB ||
> > +                     hdev->product =3D=3D USB_DEVICE_ID_LENOVO_X12_TAB=
2);
>
> If that list grows too much, we will probably have to rely on
> .driver_data. But something for later IMO.
>
Acknowledged
> > +
> >       lenovo_led_set_tp10ubkbd(hdev, TP10UBKBD_FN_LOCK_LED, data->fn_lo=
ck);
> >
> >       ret =3D sysfs_create_group(&hdev->dev.kobj, &lenovo_attr_group_tp=
10ubkbd);
> > @@ -1284,6 +1396,8 @@ static int lenovo_probe(struct hid_device *hdev,
> >       case USB_DEVICE_ID_LENOVO_TPIIBTKBD:
> >               ret =3D lenovo_probe_cptkbd(hdev);
> >               break;
> > +     case USB_DEVICE_ID_LENOVO_X12_TAB:
> > +     case USB_DEVICE_ID_LENOVO_X12_TAB2:
> >       case USB_DEVICE_ID_LENOVO_TP10UBKBD:
> >       case USB_DEVICE_ID_LENOVO_X1_TAB:
> >               ret =3D lenovo_probe_tp10ubkbd(hdev);
> > @@ -1370,6 +1484,8 @@ static void lenovo_remove(struct hid_device *hdev=
)
> >       case USB_DEVICE_ID_LENOVO_TPIIBTKBD:
> >               lenovo_remove_cptkbd(hdev);
> >               break;
> > +     case USB_DEVICE_ID_LENOVO_X12_TAB:
> > +     case USB_DEVICE_ID_LENOVO_X12_TAB2:
> >       case USB_DEVICE_ID_LENOVO_TP10UBKBD:
> >       case USB_DEVICE_ID_LENOVO_X1_TAB:
> >               lenovo_remove_tp10ubkbd(hdev);
> > @@ -1421,6 +1537,10 @@ static const struct hid_device_id lenovo_devices=
[] =3D {
> >        */
> >       { HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
> >                    USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_X1_TAB) }=
,
> > +     { HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
> > +                  USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_X12_TAB) =
},
> > +     { HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
> > +                  USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_X12_TAB2)=
 },
> >       { }
> >  };
> >
>
> Cheers,
> Benjamin

--=20

Regards,

      Vishnu Sankar

