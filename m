Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 560EF2B3EA8
	for <lists+linux-input@lfdr.de>; Mon, 16 Nov 2020 09:32:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726291AbgKPIaV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Nov 2020 03:30:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51926 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726176AbgKPIaV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Nov 2020 03:30:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1605515418;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=UXtlcL47OfCnwBOojAdKLgGCR61RSqGjwGkoA/k6MHA=;
        b=I2ETDZl3FaPVhi/Kot4CggX0t9Z11p0rXZEgX9h0niOysxiCL8BJl193qavniXq5KX/ghj
        zFHJorJ0u71zIM83K9BhZvQiXX6rjKvrrs9FpAPFmAl7J9VAgZCDfWImxUJh3hloNtSfOf
        GGGxQJO8OxN5Dmu20/RsqovbjoHt9G8=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-fluOxG1sOxW51J_aV9iGUA-1; Mon, 16 Nov 2020 03:30:16 -0500
X-MC-Unique: fluOxG1sOxW51J_aV9iGUA-1
Received: by mail-pg1-f198.google.com with SMTP id p21so2056925pgb.11
        for <linux-input@vger.kernel.org>; Mon, 16 Nov 2020 00:30:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UXtlcL47OfCnwBOojAdKLgGCR61RSqGjwGkoA/k6MHA=;
        b=qAlaH9hzT9WuWTnv9pCIb4E9p+YY57ho8c4caUWFrtNa+st11oQrhnMhlX/8MxU8Ms
         fnCgxMjLD0wfxeek+4VI/rw0DziFAERR7U4JVScmAs1KSVKrwkB3uNxrpKklbKNMjgWb
         xViKpam9gxLsgv10yRIPIPMiJfE2xw1P7O4PtQkGyDtBjm9s5RxTTGwqD0sByaS2IPFN
         qfwimyC2rdb4CVw8spMsoCb+2Rdoq/ODsOjBa78TXtHsdhxyg74ks3fN0VeWdYVriOM6
         90/PdnIUiUE5qlW8/PfFDa5AD1Oa1NkDYu4RRtVUkaoYLx5bPyo5VKsr2L3xphK7f7MF
         uLiQ==
X-Gm-Message-State: AOAM532Kt1xeJdPOeHeqXH+ySfgB6QtdZzHvbTjUkkwKh5+icbsX1wye
        jFJjwF6geyO9aOuQIua/Y3j9q5/r4PEAnPjBcV9B19ESn2B9wA6SOMBIIXFwkNlf04QDlLDNgnJ
        Co6/huVw5qfNE1Qw51vDuda8gteW1PMBBexEagcc=
X-Received: by 2002:a17:90a:c796:: with SMTP id gn22mr14244469pjb.234.1605515414920;
        Mon, 16 Nov 2020 00:30:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxhRYC6Z2Vg/23GqFosrvWxX1E4Gb2tE7wwYGNlz4Avy5XO5TE2aupx0sjSxjoMilV++N7Eaol3OmGnjv1KpR0=
X-Received: by 2002:a17:90a:c796:: with SMTP id gn22mr14244438pjb.234.1605515414494;
 Mon, 16 Nov 2020 00:30:14 -0800 (PST)
MIME-Version: 1.0
References: <20201114212058.19590-1-hdegoede@redhat.com> <20201114212058.19590-4-hdegoede@redhat.com>
In-Reply-To: <20201114212058.19590-4-hdegoede@redhat.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 16 Nov 2020 09:30:03 +0100
Message-ID: <CAO-hwJKBHvheKWRKXbKH=0Lgy5v_7-HQeCrJijrPAvNLCZtRdQ@mail.gmail.com>
Subject: Re: [RFC 3/3] HID: logitech-dj: Handle newer quad/bt2.0 receivers in
 HID proxy mode
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Hans,

Not  full review but...

On Sat, Nov 14, 2020 at 10:21 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> The Dinovo Edge and Dinovo Mini keyboards with builtin touchpad come with
> a different version of the quad/bt2.0 combo receivers shipped with the
> MX5000 and MX5500 keyboards. These receivers are compatible with one
> another, e.g. the Dinovo Edge keyboard can be paired with the MX5000
> receiver.
>
> Like the MX5x00 receivers in HID proxy mode these receivers present
> themselves as a hub with multiple USB-HID devices, one for the keyboard
> and one for the mouse.
>
> Where they differ is that the mouse USB-device has 2 input reports for
> reporting mice events. It has the exact same INPUT(2) report as the
> MX5x00 receivers, but it also has a second INPUT(5) mouse report which
> is different; and when the Dinovo receivers are paired with the Dinovo
> keyboards the second INPUT(5) mouse report is actually used for events
> on the builtin touchpad.
>
> Add support for handling the Dinovo quad/bluetooth-2.0 combo receivers
> in HID proxy mode to logitech-dj, like we already do for the similar
> MX5000 and MX5500 receivers.
>
> This adds battery monitoring functionality (through logitech-hidpp) and
> fixes the Phone (Fn + F1) and "[A]" - "[D]" (Fn + F9 - F12) hotkeys not
> working on the Dinovo Edge.
>
> Note these receivers present themselves as a hub with 2 separate USB
> devices for the keyboard and mouse; and the logitech-dj code needs to
> bind to both devices (just as with the MX5x00 receivers).
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/hid/hid-ids.h         |  6 ++-
>  drivers/hid/hid-lg.c          | 24 ---------
>  drivers/hid/hid-logitech-dj.c | 91 +++++++++++++++++++++++++++++++++--
>  drivers/hid/hid-quirks.c      |  2 -
>  4 files changed, 92 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index 108081ab5ae3..e17f252ba60f 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -797,12 +797,14 @@
>  #define USB_DEVICE_ID_SPACETRAVELLER   0xc623
>  #define USB_DEVICE_ID_SPACENAVIGATOR   0xc626
>  #define USB_DEVICE_ID_DINOVO_DESKTOP   0xc704
> -#define USB_DEVICE_ID_DINOVO_EDGE      0xc714
> -#define USB_DEVICE_ID_DINOVO_MINI      0xc71f
>  #define USB_DEVICE_ID_MX5000_RECEIVER_MOUSE_DEV                0xc70a
>  #define USB_DEVICE_ID_MX5000_RECEIVER_KBD_DEV          0xc70e
> +#define USB_DEVICE_ID_DINOVO_EDGE_RECEIVER_KBD_DEV     0xc713
> +#define USB_DEVICE_ID_DINOVO_EDGE_RECEIVER_MOUSE_DEV   0xc714
>  #define USB_DEVICE_ID_MX5500_RECEIVER_KBD_DEV          0xc71b
>  #define USB_DEVICE_ID_MX5500_RECEIVER_MOUSE_DEV                0xc71c
> +#define USB_DEVICE_ID_DINOVO_MINI_RECEIVER_KBD_DEV     0xc71e
> +#define USB_DEVICE_ID_DINOVO_MINI_RECEIVER_MOUSE_DEV   0xc71f
>  #define USB_DEVICE_ID_LOGITECH_MOMO_WHEEL2     0xca03
>  #define USB_DEVICE_ID_LOGITECH_VIBRATION_WHEEL 0xca04
>
> diff --git a/drivers/hid/hid-lg.c b/drivers/hid/hid-lg.c
> index 0dc7cdfc56f7..d40af911df63 100644
> --- a/drivers/hid/hid-lg.c
> +++ b/drivers/hid/hid-lg.c
> @@ -568,22 +568,6 @@ static int lg_ultrax_remote_mapping(struct hid_input *hi,
>         return 1;
>  }
>
> -static int lg_dinovo_mapping(struct hid_input *hi, struct hid_usage *usage,
> -               unsigned long **bit, int *max)
> -{
> -       if ((usage->hid & HID_USAGE_PAGE) != HID_UP_LOGIVENDOR)
> -               return 0;
> -
> -       switch (usage->hid & HID_USAGE) {
> -
> -       case 0x00d: lg_map_key_clear(KEY_MEDIA);        break;
> -       default:
> -               return 0;
> -
> -       }
> -       return 1;
> -}
> -

I am not sure these changes on hid-logitech-hidpp.c are something you
wanted to put in. Looks like the patch reverts the Dinovo Mini in 1/3.

Cheers,
Benjamin

>  static int lg_wireless_mapping(struct hid_input *hi, struct hid_usage *usage,
>                 unsigned long **bit, int *max)
>  {
> @@ -668,10 +652,6 @@ static int lg_input_mapping(struct hid_device *hdev, struct hid_input *hi,
>                         lg_ultrax_remote_mapping(hi, usage, bit, max))
>                 return 1;
>
> -       if (hdev->product == USB_DEVICE_ID_DINOVO_MINI &&
> -                       lg_dinovo_mapping(hi, usage, bit, max))
> -               return 1;
> -
>         if ((drv_data->quirks & LG_WIRELESS) && lg_wireless_mapping(hi, usage, bit, max))
>                 return 1;
>
> @@ -879,10 +859,6 @@ static const struct hid_device_id lg_devices[] = {
>
>         { HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_DINOVO_DESKTOP),
>                 .driver_data = LG_DUPLICATE_USAGES },
> -       { HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_DINOVO_EDGE),
> -               .driver_data = LG_DUPLICATE_USAGES },
> -       { HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_DINOVO_MINI),
> -               .driver_data = LG_DUPLICATE_USAGES },
>
>         { HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_ELITE_KBD),
>                 .driver_data = LG_IGNORE_DOUBLED_WHEEL | LG_EXPANDED_KEYMAP },
> diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
> index eaaedbb84a8d..e9e294b66e59 100644
> --- a/drivers/hid/hid-logitech-dj.c
> +++ b/drivers/hid/hid-logitech-dj.c
> @@ -84,6 +84,7 @@
>  #define STD_MOUSE                              BIT(2)
>  #define MULTIMEDIA                             BIT(3)
>  #define POWER_KEYS                             BIT(4)
> +#define KBD_MOUSE                              BIT(5)
>  #define MEDIA_CENTER                           BIT(8)
>  #define KBD_LEDS                               BIT(14)
>  /* Fake (bitnr > NUMBER_OF_HID_REPORTS) bit to track HID++ capability */
> @@ -118,6 +119,7 @@ enum recvr_type {
>         recvr_type_mouse_only,
>         recvr_type_27mhz,
>         recvr_type_bluetooth,
> +       recvr_type_dinovo,
>  };
>
>  struct dj_report {
> @@ -334,6 +336,47 @@ static const char mse_bluetooth_descriptor[] = {
>         0xC0,                   /*  END_COLLECTION                      */
>  };
>
> +/* Mouse descriptor (5) for Bluetooth receiver, normal-res hwheel, 8 buttons */
> +static const char mse5_bluetooth_descriptor[] = {
> +       0x05, 0x01,             /*  USAGE_PAGE (Generic Desktop)        */
> +       0x09, 0x02,             /*  Usage (Mouse)                       */
> +       0xa1, 0x01,             /*  Collection (Application)            */
> +       0x85, 0x05,             /*   Report ID (5)                      */
> +       0x09, 0x01,             /*   Usage (Pointer)                    */
> +       0xa1, 0x00,             /*   Collection (Physical)              */
> +       0x05, 0x09,             /*    Usage Page (Button)               */
> +       0x19, 0x01,             /*    Usage Minimum (1)                 */
> +       0x29, 0x08,             /*    Usage Maximum (8)                 */
> +       0x15, 0x00,             /*    Logical Minimum (0)               */
> +       0x25, 0x01,             /*    Logical Maximum (1)               */
> +       0x95, 0x08,             /*    Report Count (8)                  */
> +       0x75, 0x01,             /*    Report Size (1)                   */
> +       0x81, 0x02,             /*    Input (Data,Var,Abs)              */
> +       0x05, 0x01,             /*    Usage Page (Generic Desktop)      */
> +       0x16, 0x01, 0xf8,       /*    Logical Minimum (-2047)           */
> +       0x26, 0xff, 0x07,       /*    Logical Maximum (2047)            */
> +       0x75, 0x0c,             /*    Report Size (12)                  */
> +       0x95, 0x02,             /*    Report Count (2)                  */
> +       0x09, 0x30,             /*    Usage (X)                         */
> +       0x09, 0x31,             /*    Usage (Y)                         */
> +       0x81, 0x06,             /*    Input (Data,Var,Rel)              */
> +       0x15, 0x81,             /*    Logical Minimum (-127)            */
> +       0x25, 0x7f,             /*    Logical Maximum (127)             */
> +       0x75, 0x08,             /*    Report Size (8)                   */
> +       0x95, 0x01,             /*    Report Count (1)                  */
> +       0x09, 0x38,             /*    Usage (Wheel)                     */
> +       0x81, 0x06,             /*    Input (Data,Var,Rel)              */
> +       0x05, 0x0c,             /*    Usage Page (Consumer Devices)     */
> +       0x0a, 0x38, 0x02,       /*    Usage (AC Pan)                    */
> +       0x15, 0x81,             /*    Logical Minimum (-127)            */
> +       0x25, 0x7f,             /*    Logical Maximum (127)             */
> +       0x75, 0x08,             /*    Report Size (8)                   */
> +       0x95, 0x01,             /*    Report Count (1)                  */
> +       0x81, 0x06,             /*    Input (Data,Var,Rel)              */
> +       0xc0,                   /*   End Collection                     */
> +       0xc0,                   /*  End Collection                      */
> +};
> +
>  /* Gaming Mouse descriptor (2) */
>  static const char mse_high_res_descriptor[] = {
>         0x05, 0x01,             /*  USAGE_PAGE (Generic Desktop)        */
> @@ -481,6 +524,7 @@ static const char hidpp_descriptor[] = {
>  #define MAX_RDESC_SIZE                         \
>         (sizeof(kbd_descriptor) +               \
>          sizeof(mse_bluetooth_descriptor) +     \
> +        sizeof(mse5_bluetooth_descriptor) +    \
>          sizeof(consumer_descriptor) +          \
>          sizeof(syscontrol_descriptor) +        \
>          sizeof(media_descriptor) +     \
> @@ -518,6 +562,11 @@ static void delayedwork_callback(struct work_struct *work);
>  static LIST_HEAD(dj_hdev_list);
>  static DEFINE_MUTEX(dj_hdev_list_lock);
>
> +static bool recvr_type_is_bluetooth(enum recvr_type type)
> +{
> +       return type == recvr_type_bluetooth || type == recvr_type_dinovo;
> +}
> +
>  /*
>   * dj/HID++ receivers are really a single logical entity, but for BIOS/Windows
>   * compatibility they have multiple USB interfaces. On HID++ receivers we need
> @@ -535,7 +584,7 @@ static struct dj_receiver_dev *dj_find_receiver_dev(struct hid_device *hdev,
>          * The bluetooth receiver contains a built-in hub and has separate
>          * USB-devices for the keyboard and mouse interfaces.
>          */
> -       sep = (type == recvr_type_bluetooth) ? '.' : '/';
> +       sep = recvr_type_is_bluetooth(type) ? '.' : '/';
>
>         /* Try to find an already-probed interface from the same device */
>         list_for_each_entry(djrcv_dev, &dj_hdev_list, list) {
> @@ -873,6 +922,14 @@ static void logi_dj_recv_queue_notification(struct dj_receiver_dev *djrcv_dev,
>   * touchpad to work we must also forward mouse input reports to the dj_hiddev
>   * created for the keyboard (instead of forwarding them to a second paired
>   * device with a device_type of REPORT_TYPE_MOUSE as we normally would).
> + *
> + * On Dinovo receivers the keyboard's touchpad and an optional paired actual
> + * mouse send separate input reports, INPUT(2) aka STD_MOUSE for the mouse
> + * and INPUT(5) aka KBD_MOUSE for the keyboard's touchpad.
> + *
> + * On MX5x00 receivers (which can also be paired with a Dinovo keyboard)
> + * INPUT(2) is used for both an optional paired actual mouse and for the
> + * keyboard's touchpad.
>   */
>  static const u16 kbd_builtin_touchpad_ids[] = {
>         0xb309, /* Dinovo Edge */
> @@ -899,7 +956,10 @@ static void logi_hidpp_dev_conn_notif_equad(struct hid_device *hdev,
>                 id = (workitem->quad_id_msb << 8) | workitem->quad_id_lsb;
>                 for (i = 0; i < ARRAY_SIZE(kbd_builtin_touchpad_ids); i++) {
>                         if (id == kbd_builtin_touchpad_ids[i]) {
> -                               workitem->reports_supported |= STD_MOUSE;
> +                               if (djrcv_dev->type == recvr_type_dinovo)
> +                                       workitem->reports_supported |= KBD_MOUSE;
> +                               else
> +                                       workitem->reports_supported |= STD_MOUSE;
>                                 break;
>                         }
>                 }
> @@ -1367,7 +1427,7 @@ static int logi_dj_ll_parse(struct hid_device *hid)
>                 else if (djdev->dj_receiver_dev->type == recvr_type_27mhz)
>                         rdcat(rdesc, &rsize, mse_27mhz_descriptor,
>                               sizeof(mse_27mhz_descriptor));
> -               else if (djdev->dj_receiver_dev->type == recvr_type_bluetooth)
> +               else if (recvr_type_is_bluetooth(djdev->dj_receiver_dev->type))
>                         rdcat(rdesc, &rsize, mse_bluetooth_descriptor,
>                               sizeof(mse_bluetooth_descriptor));
>                 else
> @@ -1375,6 +1435,13 @@ static int logi_dj_ll_parse(struct hid_device *hid)
>                               sizeof(mse_descriptor));
>         }
>
> +       if (djdev->reports_supported & KBD_MOUSE) {
> +               dbg_hid("%s: sending a kbd-mouse descriptor, reports_supported: %llx\n",
> +                       __func__, djdev->reports_supported);
> +               rdcat(rdesc, &rsize, mse5_bluetooth_descriptor,
> +                     sizeof(mse5_bluetooth_descriptor));
> +       }
> +
>         if (djdev->reports_supported & MULTIMEDIA) {
>                 dbg_hid("%s: sending a multimedia report descriptor: %llx\n",
>                         __func__, djdev->reports_supported);
> @@ -1692,6 +1759,7 @@ static int logi_dj_probe(struct hid_device *hdev,
>         case recvr_type_mouse_only:     no_dj_interfaces = 2; break;
>         case recvr_type_27mhz:          no_dj_interfaces = 2; break;
>         case recvr_type_bluetooth:      no_dj_interfaces = 2; break;
> +       case recvr_type_dinovo:         no_dj_interfaces = 2; break;
>         }
>         if (hid_is_using_ll_driver(hdev, &usb_hid_driver)) {
>                 intf = to_usb_interface(hdev->dev.parent);
> @@ -1920,6 +1988,23 @@ static const struct hid_device_id logi_dj_receivers[] = {
>           HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
>                 USB_DEVICE_ID_MX5500_RECEIVER_MOUSE_DEV),
>          .driver_data = recvr_type_bluetooth},
> +
> +       { /* Logitech Dinovo Edge HID++ / bluetooth receiver keyboard intf. (0xc713) */
> +         HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
> +               USB_DEVICE_ID_DINOVO_EDGE_RECEIVER_KBD_DEV),
> +        .driver_data = recvr_type_dinovo},
> +       { /* Logitech Dinovo Edge HID++ / bluetooth receiver mouse intf. (0xc714) */
> +         HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
> +               USB_DEVICE_ID_DINOVO_EDGE_RECEIVER_MOUSE_DEV),
> +        .driver_data = recvr_type_dinovo},
> +       { /* Logitech DiNovo Mini HID++ / bluetooth receiver mouse intf. (0xc71e) */
> +         HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
> +               USB_DEVICE_ID_DINOVO_MINI_RECEIVER_KBD_DEV),
> +        .driver_data = recvr_type_dinovo},
> +       { /* Logitech DiNovo Mini HID++ / bluetooth receiver keyboard intf. (0xc71f) */
> +         HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
> +               USB_DEVICE_ID_DINOVO_MINI_RECEIVER_MOUSE_DEV),
> +        .driver_data = recvr_type_dinovo},
>         {}
>  };
>
> diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
> index 7a2be0205dfd..8fce238f120d 100644
> --- a/drivers/hid/hid-quirks.c
> +++ b/drivers/hid/hid-quirks.c
> @@ -439,8 +439,6 @@ static const struct hid_device_id hid_have_special_driver[] = {
>         { HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_S510_RECEIVER) },
>         { HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_RECEIVER) },
>         { HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_DINOVO_DESKTOP) },
> -       { HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_DINOVO_EDGE) },
> -       { HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_DINOVO_MINI) },
>         { HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_ELITE_KBD) },
>         { HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_CORDLESS_DESKTOP_LX500) },
>         { HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_EXTREME_3D) },
> --
> 2.28.0
>

