Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DA13619229
	for <lists+linux-input@lfdr.de>; Fri,  4 Nov 2022 08:46:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231309AbiKDHqI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 4 Nov 2022 03:46:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbiKDHqH (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 4 Nov 2022 03:46:07 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D617E1144;
        Fri,  4 Nov 2022 00:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
        t=1667547964; bh=m9kw+eOVEMdxZMfWtRsPrNpHzgjWjdBNKVTETR3AFZY=;
        h=X-UI-Sender-Class:References:In-Reply-To:From:Date:Subject:To:Cc;
        b=mbopFBLtrisnwUDu9empzYaASJXvs2QfjHuMmj8T2kur6UvfAxUW8eSBhUb6pMNe6
         727jnlGLA7+aFx4c2Se+0yz6Dj2M0cSQX5IYFRIKIC1Mvf63zt/keCb1eWSMycj/LZ
         KkjyiI48CeuhgleliR/bhETlfj5mILI7W4zj1Z26Q7pPmpyVZG/0L3Vxd6a5K8bkML
         YVBB81VJ34dxyLQXlDUHZDUUt9R0vspidwi3QBgsZmalRzzaT73uuCZnipSAz0atL9
         NbdISx/P3y8IB9NJLcR5Vjmo5WlvB/5N8N8mu1vjcvYvKf07WXmILK2//CA96AcJhh
         1HG8CEnsOLIGQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mail-ed1-f42.google.com ([209.85.208.42]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MBlxM-1ojCx53fhs-00C9Xi; Fri, 04 Nov 2022 08:46:03 +0100
Received: by mail-ed1-f42.google.com with SMTP id z18so6406126edb.9;
        Fri, 04 Nov 2022 00:46:03 -0700 (PDT)
X-Gm-Message-State: ACrzQf1WFRh+SMajjaJexB8fRtHeYKTzE3hBZbe4vDWNhU4d7L19JHjI
        KQqblSo8MozT0jbXWeV0oNR7zayq37sxDuD46ls=
X-Google-Smtp-Source: AMsMyM6yBtDlThZrV2LPwiHjlYGwYrW/D7SVC+5hIEsxjhqxqCsGzSTH9zpwEMePuRRnZApJSsaIaPxX5rptlUBP9vo=
X-Received: by 2002:a05:6402:5419:b0:457:c955:a40f with SMTP id
 ev25-20020a056402541900b00457c955a40fmr33669821edb.391.1667547963397; Fri, 04
 Nov 2022 00:46:03 -0700 (PDT)
MIME-Version: 1.0
References: <Y1AVDck5sQf8+QFX@rowland.harvard.edu> <CABfF9mPU52OXTGcsbatJCG4nbP4zaPN3iJnttMg+xRyGY6dUEQ@mail.gmail.com>
 <CAO-hwJJ7cF-4kd8Mi6bb5n-k5LuMrWbpdMqFs82y7iQOscr-7g@mail.gmail.com>
 <CABfF9mNfU=swmpVXfVr7pYWs72jrd-HDY8+_NXyBDAKa4CWG5Q@mail.gmail.com>
 <CAO-hwJ+i3zd=CyU0T+Nb1vGfZfenMBH16ern_ncTTKEpyGAuBA@mail.gmail.com>
 <CABfF9mNrMx2BzU5tbBeapY15M4Ls_5xYBGfVB=Up5TJu=eWCcg@mail.gmail.com> <CAO-hwJJGAWkhZgGeLBruqCoskY5PBP-STs4kh-P6fBvpuSgpUw@mail.gmail.com>
In-Reply-To: <CAO-hwJJGAWkhZgGeLBruqCoskY5PBP-STs4kh-P6fBvpuSgpUw@mail.gmail.com>
From:   Andreas Bergmeier <abergmeier@gmx.net>
Date:   Fri, 4 Nov 2022 08:45:52 +0100
X-Gmail-Original-Message-ID: <CABfF9mMf433M=kXjqG85rdavFXHRqn0hyBujbMTfEoUG7vZD-g@mail.gmail.com>
Message-ID: <CABfF9mMf433M=kXjqG85rdavFXHRqn0hyBujbMTfEoUG7vZD-g@mail.gmail.com>
Subject: Re: Litra Glow on Linux
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org,
        USB mailing list <linux-usb@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Jiri Kosina <jikos@kernel.org>, linux-leds@vger.kernel.org,
        Nestor Lopez Casado <nlopezcasad@logitech.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:zQ7N6pLnrv8Pqz/wJ/sRFchKV3vPu3c8niii/Q3+a8aVgOm+KHQ
 xpTFDWByo4g4XozHY2V/HBujlpwghEGaymD2wJFl9TMsbYsRMDsJNqxt3XQ3QyoPThHzIpm
 Nx4+XOhunSuymun/r4RLusipdK08RZTeCN2OS9JhG6cn2tO3Lf0uZkZ7P7qU/7vZnBTwbcB
 5Mp3dCn+btF6s/C+k9v9w==
UI-OutboundReport: notjunk:1;M01:P0:hBn7EThuB7M=;p9a9Dm5E8BImlT52J2tNDhCnbDW
 bVW0yQ9cAiW3WGiJC80dl0YNnXsR7PIr3FE7fC+wOOu/XnrXxF5zbvILkwy8YzvMnrby/lai2
 S3tHBOy12i4Wff1WbEIBgtN7kUMNGQEUXs/Va/+5op1E5vEsfO4qHwEAvNzkaXcifldu5kKFc
 +43kSqslM4hERExVVOmXdhpablFJmuPZ/+MDCJKvL+JH/1c8oUM0UbszJQq0BXWtQkcr+9zcA
 Ea3ZKeOsc2zMu+HidQDOxBxab9JO6HP1figKnvPhjZ4UQLBjg8BsXeIekxqEwt4q8HcKPpHFq
 l7gbC4mLd2APD6GUJlMBU96pXc6kSmsnV8O5iYS2LXuNMenb7PqFd6CGEB6+ufi3/Aj32EKzZ
 coVCvNA3o8dz+Ox9IwMxvLnXjyb96Rugn+zdIHUe6Z2EDbYEPm+RkPNzhRsveIY7fpG76kXcb
 u0pFWIGGkO+4YYnlX1Egs0q0Yeefpbb7ZTtDArfeVxoyDFPI6QSPsXQNW4oGGnHcQbu4XwDqY
 icTYhgMdmMI1xHhnZqVer41UEcWQ4O00WdmrtGxxcJ2Yd2LbUKtyFsqUJMZeq4ELHZQYHWqkT
 D8mJfEez2VV5wiBRO3FPGaU2a7Af9fCKGzBssqClX0NMluH1bVRm1koLBoY5UTf9A+UjTr3+z
 ZnerAWTV8CqXb19J33Gdpp+uBBVxN5figIRzT9vXm8d6/I40RbRR7DdQZ7ukHfVfuj0M/LIvK
 SdV2Y7vByr/xkh2F1pVwfpCUKwDzdVYUaLfHLfBtfeyVwcOMzohr6dgajj6xRq+WDkLMGfadE
 yO9pd2s6aqnZP6DOQGGRhwQq9RE+6EDVpmmse/2F+4tvy4/Zd6AS5xFmjt1U/U8Hp7dx8b6K0
 YE4hNHADGiH0yoaaDH9vlj5NKslnUrWsRpzPokHkXFrFeUTxbQJVIJJLXme9UUvOwTLM9WrZh
 g5SsH2JrR6cMg+SLWCtjvWtrPpo=
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLACK autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

See my first stab at the problem below.

On Mon, 31 Oct 2022 at 10:29, Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
> On Sat, Oct 29, 2022 at 9:21 AM Andreas Bergmeier <abergmeier@gmx.net> wrote:
> >
> > Sorry, another set of questions - seems like I am a bit dense.
> >
> > On Thu, 27 Oct 2022 at 11:44, Benjamin Tissoires
> > <benjamin.tissoires@redhat.com> wrote:
> > > It's just Logitech's common HID protocol. The advantage is that if
> > > Logitech reuses the feature on a different hardware, we won't have to
> > > implement anything new in the kernel.
> > Started implementing some illumination code but will take a while
> > until I figure out the driver I think.
> >
> > > But from where you are now, you should probably be able to implement
> > > the basic on/off feature by looking at the function 0x1000 in the
> > > hid-logitech-hidpp code:
> > > - you need define a few macros for your functionality (the class, the
> > > commands, the events)
> > So my approach would be to identify the GLOW device and then at some
> > later point create the
> > illumination state and from there only handle common illumination.
>
> For identifying the GLOW device you should be adding an id in the
> table of hid-logitech-hidpp, with a driver data that tells the driver
> to look for 0x1990.
Currently compiles and should have all handling that seemed necessary to me.
Will now try to get the compiled kernel running on an Ubuntu - that
might take a while.
RFC:
diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 71a9c258a20b..bdc2949d1be5 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -11,6 +11,7 @@
#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
#include <linux/device.h>
+#include <linux/dmi.h>
#include <linux/input.h>
#include <linux/usb.h>
#include <linux/hid.h>
@@ -99,6 +100,7 @@ MODULE_PARM_DESC(disable_tap_to_click,
#define HIDPP_CAPABILITY_HIDPP20_HI_RES_WHEEL BIT(7)
#define HIDPP_CAPABILITY_HIDPP20_HI_RES_SCROLL BIT(8)
#define HIDPP_CAPABILITY_HIDPP10_FAST_SCROLL BIT(9)
+#define HIDPP_CAPABILITY_ILLUMINATION_LIGHT BIT(10)
#define lg_map_key_clear(c) hid_map_usage_clear(hi, usage, bit, max,
EV_KEY, (c))
@@ -206,7 +208,10 @@ struct hidpp_device {
struct hidpp_battery battery;
struct hidpp_scroll_counter vertical_wheel_counter;
- u8 wireless_feature_index;
+ union {
+ u8 wireless_feature_index;
+ u8 illumination_feature_index;
+ };
};
/* HID++ 1.0 error codes */
@@ -862,6 +867,8 @@ static int hidpp_unifying_init(struct hidpp_device *hidpp)
#define CMD_ROOT_GET_FEATURE 0x00
#define CMD_ROOT_GET_PROTOCOL_VERSION 0x10
+#define HIDPP_FEATURE_TYPE_HIDDEN 0x70
+
static int hidpp_root_get_feature(struct hidpp_device *hidpp, u16 feature,
u8 *feature_index, u8 *feature_type)
{
@@ -1729,6 +1736,294 @@ static int
hidpp_set_wireless_feature_index(struct hidpp_device *hidpp)
return ret;
}
+/* --------------------------------------------------------------------------
*/
+/* 0x1990: Illumination Light */
+/* --------------------------------------------------------------------------
*/
+
+#define HIDPP_PAGE_ILLUMINATION_LIGHT 0x1990
+
+#define HIDPP_ILLUMINATION_FUNC_GET 0x00
+#define HIDPP_ILLUMINATION_FUNC_SET 0x10
+#define HIDPP_ILLUMINATION_FUNC_GET_BRIGHTNESS_INFO 0x20
+#define HIDPP_ILLUMINATION_FUNC_GET_BRIGHTNESS 0x30
+#define HIDPP_ILLUMINATION_FUNC_SET_BRIGHTNESS 0x40
+
+/* Not yet supported
+#define HIDPP_ILLUMINATION_FUNC_GET_BRIGHTNESS_LEVELS 0x50
+#define HIDPP_ILLUMINATION_FUNC_SET_BRIGHTNESS_LEVELS 0x60
+*/
+
+#define HIDPP_ILLUMINATION_FUNC_GET_COLOR_TEMPERATURE_INFO 0x70
+#define HIDPP_ILLUMINATION_FUNC_GET_COLOR_TEMPERATURE 0x80
+#define HIDPP_ILLUMINATION_FUNC_SET_COLOR_TEMPERATURE 0x90
+
+#define HIDPP_ILLUMINATION_EVENT_CHANGE 0x00
+#define HIDPP_ILLUMINATION_EVENT_BRIGHTNESS_CHANGE 0x10
+#define HIDPP_ILLUMINATION_EVENT_COLOR_TEMPERATURE_CHANGE 0x20
+
+#define HIDPP_ILLUMINATION_CAP_NON_LINEAR_LEVELS 0x04
+#define HIDPP_ILLUMINATION_CAP_LINEAR_LEVELS 0x02
+#define HIDPP_ILLUMINATION_CAP_EVENTS 0x01
+
+struct led_data {
+ struct led_classdev cdev;
+ struct hidpp_device *drv_data;
+ struct hid_device *hdev;
+ struct work_struct work;
+ u16 feature_index;
+ bool on;
+ unsigned int brightness;
+ unsigned int color_temperature;
+ bool removed;
+};
+
+static enum led_brightness led_brightness_get(struct led_classdev *led_cdev) {
+ struct led_data *led = container_of(led_cdev, struct led_data,
+ cdev);
+
+ if (!led->on) {
+ return LED_OFF;
+ }
+
+ return led->brightness + 1;
+}
+
+static void led_brightness_set(struct led_classdev *led_cdev, enum
led_brightness brightness) {
+ struct led_data *led = container_of(led_cdev, struct led_data,
+ cdev);
+ led->on = brightness != 0;
+ if (led->on) {
+ led->brightness = brightness - 1;
+ }
+
+ schedule_work(&led->work);
+}
+
+static unsigned int led_color_temperature_get(struct led_classdev *led_cdev) {
+ struct led_data *led = container_of(led_cdev, struct led_data,
+ cdev);
+ return led->color_temperature;
+}
+
+static void led_color_temperature_set(struct led_classdev *led_cdev,
unsigned int color_temperature) {
+ struct led_data *led = container_of(led_cdev, struct led_data,
+ cdev);
+
+ led->color_temperature = color_temperature;
+ schedule_work(&led->work);
+}
+
+static void led_work(struct work_struct *work)
+{
+ struct hidpp_device *hidpp;
+ u8 params[20];
+ int ret;
+ struct hidpp_report report;
+ struct led_data *led = container_of(work, struct led_data, work);
+
+ if (led->removed)
+ return;
+
+ hidpp = led->drv_data;
+
+ memset(&params, 0, sizeof(params)/sizeof(*params));
+ if (!led->on) {
+ ret = hidpp_send_fap_command_sync(hidpp,
hidpp->illumination_feature_index, HIDPP_ILLUMINATION_FUNC_SET,
params, 20, &report);
+ if (ret) {
+ return;
+ }
+ }
+
+ ret = hidpp_send_fap_command_sync(hidpp,
hidpp->illumination_feature_index,
HIDPP_ILLUMINATION_FUNC_SET_BRIGHTNESS, params, 20, &report);
+ if (ret) {
+ return;
+ }
+
+ ret = hidpp_send_fap_command_sync(hidpp,
hidpp->illumination_feature_index,
HIDPP_ILLUMINATION_FUNC_SET_COLOR_TEMPERATURE, params, 20, &report);
+ if (ret) {
+ return;
+ }
+}
+
+struct control_info{
+ u16 min;
+ u16 max;
+ u16 res;
+ u8 capabilities;
+ u8 max_levels;
+};
+
+static int get_brightness_info_sync(struct hidpp_device *hidpp,
struct control_info* info) {
+ struct hidpp_report resp;
+ int ret = hidpp_send_fap_command_sync(hidpp,
hidpp->illumination_feature_index,
HIDPP_ILLUMINATION_FUNC_GET_BRIGHTNESS_INFO, NULL, 0, &resp);
+ if (ret)
+ return ret;
+
+ info->capabilities = resp.fap.params[0];
+ info->min = be16_to_cpu(resp.fap.params[1] << 8 | resp.fap.params[2] << 0);
+ info->max = be16_to_cpu(resp.fap.params[3] << 8 | resp.fap.params[4] << 0);
+ info->res = be16_to_cpu(resp.fap.params[5] << 8 | resp.fap.params[6] << 0);
+ info->max_levels = resp.fap.params[7];
+ return 0;
+}
+
+static int get_color_temperature_info_sync(struct hidpp_device
*hidpp, struct control_info* info) {
+ struct hidpp_report resp;
+ int ret = hidpp_send_fap_command_sync(hidpp,
hidpp->illumination_feature_index,
HIDPP_ILLUMINATION_FUNC_GET_COLOR_TEMPERATURE_INFO, NULL, 0, &resp);
+ if (ret)
+ return ret;
+
+ info->capabilities = resp.fap.params[0];
+ info->min = be16_to_cpu(resp.fap.params[1] << 8 | resp.fap.params[2] << 0);
+ info->max = be16_to_cpu(resp.fap.params[3] << 8 | resp.fap.params[4] << 0);
+ info->res = be16_to_cpu(resp.fap.params[5] << 8 | resp.fap.params[6] << 0);
+ info->max_levels = resp.fap.params[7];
+ return 0;
+}
+
+static int register_led(struct hidpp_device *hidpp)
+{
+ struct control_info bi, cti;
+ struct led_data *ld;
+ int ret = get_brightness_info_sync(hidpp, &bi);
+ if (ret)
+ return ret;
+
+ if (bi.res != 1) {
+ // FAIL - not supported
+ return -1;
+ }
+
+ ret = get_color_temperature_info_sync(hidpp, &cti);
+ if (ret)
+ return ret;
+
+ if (cti.res != 1) {
+ // FAIL - not supported
+ return -1;
+ }
+
+ ld = devm_kzalloc(&hidpp->hid_dev->dev,
+ sizeof(struct led_data),
+ GFP_KERNEL);
+ if (!ld)
+ return -ENOMEM;
+
+ ld->drv_data = hidpp;
+ ld->removed = false;
+ ld->cdev.name = hidpp->name;
+ ld->cdev.flags = LED_HW_PLUGGABLE | LED_BRIGHT_HW_CHANGED |
LED_COLOR_TEMP_HW_CHANGED;
+ /* kernel led interface designates 0 as off. To not lose the ability to chose
+ * minimal brightness, we thus need to increase the reported range by 1
+ */
+ ld->cdev.max_brightness = bi.max - bi.min + 1;
+ if (bi.max == bi.min) {
+ /* According to docs set value is not supported under these
+ * conditions
+ */
+ ld->cdev.brightness_set = NULL;
+ } else {
+ ld->cdev.brightness_set = led_brightness_set;
+ }
+ ld->cdev.brightness_get = led_brightness_get;
+
+ ld->cdev.min_color_temperature = cti.min;
+ ld->cdev.max_color_temperature = cti.max;
+ if (bi.max == bi.min) {
+ /* According to docs set value is not supported under these
+ * conditions
+ */
+ ld->cdev.color_temperature_set = NULL;
+ } else {
+ ld->cdev.color_temperature_set = led_color_temperature_set;
+ }
+ ld->cdev.color_temperature_get = led_color_temperature_get;
+ INIT_WORK(&ld->work, led_work);
+ ret = devm_led_classdev_register(&hidpp->hid_dev->dev, &ld->cdev);
+ if (ret < 0) {
+ /* No need to have this still around */
+ devm_kfree(&hidpp->hid_dev->dev, ld);
+ }
+ hidpp->private_data = ld;
+ return 0;
+}
+
+/* TODO: Do we need this
+static int unregister_led(struct hidpp_device *hidpp,) {
+ devm_led_classdev_unregister(&hdev->dev, &ld->cdev);
+}
+*/
+
+static int hidpp20_illumination_raw_event(struct hidpp_device *hidpp,
u8 *data, int size) {
+
+ struct led_data *led;
+ struct hidpp_report *report = (struct hidpp_report *)data;
+ switch (report->report_id) {
+ case REPORT_ID_HIDPP_LONG:
+ /* size is already checked in hidpp_raw_event.
+ * only leave long through
+ */
+ break;
+ default:
+ return 0;
+ }
+
+ if (report->fap.feature_index != hidpp->illumination_feature_index) {
+ return 0;
+ }
+
+ led = (struct led_data*)hidpp->private_data;
+
+ if (report->fap.funcindex_clientid == HIDPP_ILLUMINATION_EVENT_CHANGE) {
+ led->on = report->fap.params[0] & 0x1;
+ if (led->on )
+ led_classdev_notify_brightness_hw_changed(&led->cdev, led->brightness + 1);
+ else
+ led_classdev_notify_brightness_hw_changed(&led->cdev, LED_OFF);
+ return 0;
+ }
+
+ if (report->fap.funcindex_clientid ==
HIDPP_ILLUMINATION_EVENT_BRIGHTNESS_CHANGE) {
+ u16 brightness = be16_to_cpu(report->fap.params[0] << 8 |
report->fap.params[1] << 0);
+ led->brightness = brightness;
+ led_classdev_notify_brightness_hw_changed(&led->cdev, led->brightness + 1);
+ return 0;
+ }
+
+ if (report->fap.funcindex_clientid ==
HIDPP_ILLUMINATION_EVENT_COLOR_TEMPERATURE_CHANGE) {
+ u16 color_temperature = be16_to_cpu(report->fap.params[0] << 8 |
report->fap.params[1] << 0);
+ led->color_temperature = color_temperature;
+ led_classdev_notify_color_temperature_hw_changed(&led->cdev,
led->color_temperature);
+ return 0;
+ }
+
+ return 0;
+}
+
+static int hidpp20_illumination_connect(struct hidpp_device *hidpp) {
+
+ u8 feature_index, feature_type;
+ int ret = hidpp_root_get_feature(hidpp,
+ HIDPP_PAGE_ILLUMINATION_LIGHT,
+ &feature_index,
+ &feature_type);
+ if (ret)
+ return ret;
+
+ if (feature_type & HIDPP_FEATURE_TYPE_HIDDEN) {
+ /* According to docs the host should ignore this feature */
+ return -ENOENT;
+ }
+
+ hidpp->illumination_feature_index = feature_index;
+
+ ret = register_led(hidpp);
+ if (!ret)
+ hidpp->capabilities |= HIDPP_CAPABILITY_ILLUMINATION_LIGHT;
+
+ return ret;
+}
+
/* -------------------------------------------------------------------------- */
/* 0x2120: Hi-resolution scrolling */
/* -------------------------------------------------------------------------- */
@@ -3648,6 +3943,12 @@ static int hidpp_raw_hidpp_event(struct
hidpp_device *hidpp, u8 *data,
return ret;
}
+ if (hidpp->capabilities & HIDPP_CAPABILITY_ILLUMINATION_LIGHT) {
+ ret = hidpp20_illumination_raw_event(hidpp, data, size);
+ if (ret != 0)
+ return ret;
+ }
+
if (hidpp->quirks & HIDPP_QUIRK_HIDPP_WHEELS) {
ret = hidpp10_wheel_raw_event(hidpp, data, size);
if (ret != 0)
@@ -4013,6 +4314,8 @@ static void hidpp_connect_event(struct
hidpp_device *hidpp)
}
hidpp->delayed_input = input;
+
+ ret = hidpp20_illumination_connect(hidpp);
}
static DEVICE_ATTR(builtin_power_supply, 0000, NULL, NULL);


>
> >
> > > - you need to add a hook in connect_event to register the led class
> > > device that will hook on to the actual LED of the device
> > I did read all the LED specs/headers that I could find and from what I
> > have seen all you can currently do with this interface is control
> > brightness. There seems to be no way of controlling the Color
> > temperature, though.
>
> Leds can be multicolor. See drivers/hid/hid-playstation.c for an example.
>
> So I think you should be able to give a color to the LED that can be
> controlled as a separate channel, different from the brightness. The
> LEDs folks will know better.
>
> > So either this then would have to be exposed as a special device or
> > get handled entirely in userspace.
> > The latter seems to work against "implementing illumination handling
> > once in driver and reusing it".
>
> I would rather have it handled as a standard LED class, a colored LED
> one. There might be a special structure for colored LEDs, and if not
> you should probably be able to use a multi-color led with just one
> color channel.
>
> >
> > > [0] https://pwr-solaar.github.io/Solaar
> > > [1] https://github.com/pwr-Solaar/Solaar/blob/master/docs/hidpp-documentation.txt
> > Thanks. Never would have found the specs on my own.
> > That said - I read x1990 spec and tried to access getIllumination from
> > userspace.
>
> Oh, good point, Nestor added that spec back in May :)
> Thanks, Nestor!
>
> > The spec seems a bit vague for my limited experience level.
> > For example I have not yet figured out what the communication (bytes)
> > difference between _getIllumination()_ and _illuminationChangedEvent_
> > is.
> > What seems to work is accessing events:
> >
> > So I tried:
> > ```c
> >
> > #define LONG_REPORT_ID 0x11
> >
> >     struct hiddev_usage_ref_multi multi;
> >     memset(&multi, 0, sizeof(multi));
> >     multi.uref.report_type = HID_REPORT_TYPE_INPUT;
> >     multi.uref.report_id = LONG_REPORT_ID;
> >     multi.uref.field_index = 0x0;
> >     multi.uref.usage_index = 0x03;
> >     multi.uref.usage_code = 0xff430002;
> >     multi.num_values = 1;
> >
> >     if (ioctl(fd, HIDIOCGUSAGES, &multi) < 0)
> >     {
> >         perror("HIDIOCGUSAGES getIllumination");
> >         return -11;
> >     }
> >
> >     printf("VALUE: %0x\n", multi.values[0]);
> >
> > ```
> > Which seems to report the illumination state until I press another
> > hardware button. So this seems to access the last event, which seems
> > to be _illuminationChangedEvent_ in my case.
> > No idea currently how to get _getIllumination_ to work.
>
> IIRC, HIDIOCGUSAGES doesn't do anything with the device, you are
> querying the kernel of its current state. Which explains why you are
> not getting the current state, but the previous known state.
>
> What you need to do, is actually emit a command to the device
> (completely untested, of course):
> ---
> #define APPLICATION_ID 0x06 // can be anything between 0x01  and 0xF,
> 0x1 being the ID from the kernel
>
> #define HIDPP_1990_GET_ILLUMINATION 0x00
> #define HIDPP_1990_SET_ILLUMINATION 0x10
> #define ....
>
> unsigned char cmd = HIDPP_1990_GET_ILLUMINATION | APPLICATION_ID;
> unsigned char buf[20] = {0x11, 0xff, 0x04}; // HIDPP ID, DEVICE INDEX,
> FEATURE INDEX in the feature table
>
> buf[3] = cmd;
> write(fd, buf, sizeof(buf));
> memset(buf, sizeof(buf), 0);
> while (buf[3] != cmd)
>   read(fd, buf, sizeof(buf));
>
> printf("VALUE: %0x\n", buf[4]);
> ---
>
> It is important to set an application id so you can differentiate your
> requests from the events (the application ID from an event is always
> 0).
>
> With that in mind, you should now be able to understand why you had to
> send {0x11, 0xff, 0x04, 0x10, 0x01} to set the illumination. And
> again, for being sure you can get the feedback you should use 0x16 as
> the fourth byte here, so you can detect your answer.
>
> I hope it makes more sense now.
>
> Cheers,
> Benjamin
>
