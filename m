Return-Path: <linux-input+bounces-478-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9598803C14
	for <lists+linux-input@lfdr.de>; Mon,  4 Dec 2023 18:52:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14C751F211AA
	for <lists+linux-input@lfdr.de>; Mon,  4 Dec 2023 17:52:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 213B72E82F;
	Mon,  4 Dec 2023 17:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dkh3jd+L"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 960AFFA
	for <linux-input@vger.kernel.org>; Mon,  4 Dec 2023 09:52:36 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2c9f413d6b2so23554591fa.1
        for <linux-input@vger.kernel.org>; Mon, 04 Dec 2023 09:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701712355; x=1702317155; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aeqXQriJ0neIOYjIH9t+v/mw2GcgTMNb2O3vTpQWPfk=;
        b=dkh3jd+L+X9gJFXsYP/+c1/hi3PKmmF3LcIlpDRMlObK1Pt/JNKq7T7180DhnbGmyy
         N0rwEjTOfkuZHtwApUfKq0WJ26OzdkuLJyWlE4RXxmO9l8XQptNHiJw50d17VmUZDil/
         H6gDonveD6o9gs8Rm77z2E8Qmq/Cacf9rqAQUFLn+EsRL+aqoPIf7SHKLlM69q34A/Th
         oXrOe66K5GTWvktEUQ0JouWWjf/ZRfncvLSMUHH4mNDSbIdPSuADCVHnasv1o0iddgEv
         KL7uPgTO3+ftrFe1xm/mR+CEZfyUv5WiEbUTNcwGJASRn42j8kD4DusQ81iVAmOw0OTB
         bG1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701712355; x=1702317155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aeqXQriJ0neIOYjIH9t+v/mw2GcgTMNb2O3vTpQWPfk=;
        b=YM14rhleKC34yKteioC/DKVJ2vzoxULIdYrVn5OSDGoL3VeOmml8Z+IeA66HGWOtAD
         maq7/dkUj3NmPk9+iUx8efz8B1t/EKB7+2mhhYr8xroup5D0ZL0k+RwzwB7jXfaCd1ku
         b+Fawav7sAr7PKc0gAxRKsM6i/QGWnO+TQS/OnBIZRgBEDjjCF+loH32ZNd/3QOwEocO
         TQq1EPDAkhnuTon2+vKSaGy+TWG37CkRT8NqiP+e27+doueT6M2FztydOkAroENU3dfm
         Lz/+XFrMu2rsERUZzwR2EMLJHSRIdCr4/6v5fLzmVGcE1yZ/EN7D3ihbVYHWSy2cHY5r
         E3lw==
X-Gm-Message-State: AOJu0YxXPhLZdkIHwuSrD8NG/ek4JG7b/TWJGdK9HV+5HgfLJjVIpjIr
	rcZBdK2LPglp71Oz1b5I/CveeWRNsYhkWig1Jqqtvh0udo8=
X-Google-Smtp-Source: AGHT+IGBiY7gp+upapfPeaQrqH6ULI5axIBl0i2tZf3VMnTFRxjSFgP5wZByWXZPcXZhW+VaWee9dOhyDEB9j8qpqu8=
X-Received: by 2002:a2e:9c92:0:b0:2ca:faf:f374 with SMTP id
 x18-20020a2e9c92000000b002ca0faff374mr144601lji.63.1701712354151; Mon, 04 Dec
 2023 09:52:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231204081721.19507-1-rymcclel@gmail.com>
In-Reply-To: <20231204081721.19507-1-rymcclel@gmail.com>
From: Daniel Ogorchock <djogorchock@gmail.com>
Date: Mon, 4 Dec 2023 12:52:22 -0500
Message-ID: <CAEVj2tmFg_o-h++994MByzUPiaGtWPChsJ3s0G9ThhEKFNo3Xw@mail.gmail.com>
Subject: Re: [PATCH] HID: nintendo: add support for nso controllers
To: Ryan McClelland <rymcclel@gmail.com>
Cc: linux-input@vger.kernel.org, benjamin.tissoires@redhat.com, 
	jikos@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ryan

On Mon, Dec 4, 2023 at 3:17=E2=80=AFAM Ryan McClelland <rymcclel@gmail.com>=
 wrote:
>
> This adds support for the nintendo switch online controllers which
> include the SNES, Genesis, and N64 Controllers.
>
> As each nso controller only implements a subset of what a pro
> controller can do. Each of these 'features' were broken up in to
> seperate functions which include right stick, left stick, imu, and
> dpad and depending on the controller type that it is, it will call
> the supported functions appropriately.
>
> Each controller now has a struct which maps the bit within the hid
> in report to a button.
>
> The name given to the device now comes directly from the hid
> device name rather than looking up a predefined string.
>
> Signed-off-by: Ryan McClelland <rymcclel@gmail.com>
> ---
>  drivers/hid/Kconfig        |  13 +-
>  drivers/hid/hid-ids.h      |   5 +-
>  drivers/hid/hid-nintendo.c | 897 ++++++++++++++++++++++++++-----------
>  3 files changed, 649 insertions(+), 266 deletions(-)
>
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index 4ce74af79657..347c284fb27e 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -761,14 +761,15 @@ config HID_MULTITOUCH
>           module will be called hid-multitouch.
>
>  config HID_NINTENDO
> -       tristate "Nintendo Joy-Con and Pro Controller support"
> +       tristate "Nintendo Joy-Con, NSO, and Pro Controller support"
>         depends on NEW_LEDS
>         depends on LEDS_CLASS
>         select POWER_SUPPLY
>         help
> -       Adds support for the Nintendo Switch Joy-Cons and Pro Controller.
> +       Adds support for the Nintendo Switch Joy-Cons, NSO, Pro Controlle=
r.
>         All controllers support bluetooth, and the Pro Controller also su=
pports
> -       its USB mode.
> +       its USB mode. This also includes support for the Nintendo Switch =
Online
> +       Controllers which include the Genesis, SNES, and N64 controllers.
>
>         To compile this driver as a module, choose M here: the
>         module will be called hid-nintendo.
> @@ -779,9 +780,9 @@ config NINTENDO_FF
>         select INPUT_FF_MEMLESS
>         help
>         Say Y here if you have a Nintendo Switch controller and want to e=
nable
> -       force feedback support for it. This works for both joy-cons and t=
he pro
> -       controller. For the pro controller, both rumble motors can be con=
trolled
> -       individually.
> +       force feedback support for it. This works for both joy-cons, the =
pro
> +       controller, and the NSO N64 controller. For the pro controller, b=
oth
> +       rumble motors can be controlled individually.
>
>  config HID_NTI
>         tristate "NTI keyboard adapters"
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index c6e4e0d1f214..a90aa3c31dd0 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -986,7 +986,10 @@
>  #define USB_DEVICE_ID_NINTENDO_JOYCONL 0x2006
>  #define USB_DEVICE_ID_NINTENDO_JOYCONR 0x2007
>  #define USB_DEVICE_ID_NINTENDO_PROCON  0x2009
> -#define USB_DEVICE_ID_NINTENDO_CHRGGRIP        0x200E
> +#define USB_DEVICE_ID_NINTENDO_CHRGGRIP        0x200e
> +#define USB_DEVICE_ID_NINTENDO_SNESCON 0x2017
> +#define USB_DEVICE_ID_NINTENDO_GENCON  0x201e
> +#define USB_DEVICE_ID_NINTENDO_N64CON  0x2019
>
>  #define USB_VENDOR_ID_NOVATEK          0x0603
>  #define USB_DEVICE_ID_NOVATEK_PCT      0x0600
> diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
> index 138f154fecef..47af111ef3a2 100644
> --- a/drivers/hid/hid-nintendo.c
> +++ b/drivers/hid/hid-nintendo.c
> @@ -3,6 +3,9 @@
>   * HID driver for Nintendo Switch Joy-Cons and Pro Controllers
>   *
>   * Copyright (c) 2019-2021 Daniel J. Ogorchock <djogorchock@gmail.com>
> + * Portions Copyright (c) 2020 Nadia Holmquist Pedersen <nadia@nhp.sh>
> + * Copyright (c) 2022 Emily Strickland <linux@emily.st>
> + * Copyright (c) 2023 Ryan McClelland <rymcclel@gmail.com>
>   *
>   * The following resources/projects were referenced for this driver:
>   *   https://github.com/dekuNukem/Nintendo_Switch_Reverse_Engineering
> @@ -17,6 +20,9 @@
>   * This driver supports the Nintendo Switch Joy-Cons and Pro Controllers=
. The
>   * Pro Controllers can either be used over USB or Bluetooth.
>   *
> + * This driver also incorporates support for Nintendo Switch Online cont=
rollers
> + * for the NES, SNES, Sega Genesis, and N64.
> + *
>   * The driver will retrieve the factory calibration info from the contro=
llers,
>   * so little to no user calibration should be required.
>   *
> @@ -305,9 +311,14 @@ enum joycon_ctlr_state {
>
>  /* Controller type received as part of device info */
>  enum joycon_ctlr_type {
> -       JOYCON_CTLR_TYPE_JCL =3D 0x01,
> -       JOYCON_CTLR_TYPE_JCR =3D 0x02,
> -       JOYCON_CTLR_TYPE_PRO =3D 0x03,
> +       JOYCON_CTLR_TYPE_JCL  =3D 0x01,
> +       JOYCON_CTLR_TYPE_JCR  =3D 0x02,
> +       JOYCON_CTLR_TYPE_PRO  =3D 0x03,
> +       JOYCON_CTLR_TYPE_NESL =3D 0x09,
> +       JOYCON_CTLR_TYPE_NESR =3D 0x0A,
> +       JOYCON_CTLR_TYPE_SNES =3D 0x0B,
> +       JOYCON_CTLR_TYPE_GEN  =3D 0x0D,
> +       JOYCON_CTLR_TYPE_N64  =3D 0x0C,
>  };
>
>  struct joycon_stick_cal {
> @@ -348,6 +359,137 @@ static const u32 JC_BTN_SL_L      =3D BIT(21);
>  static const u32 JC_BTN_L      =3D BIT(22);
>  static const u32 JC_BTN_ZL     =3D BIT(23);
>
> +struct joycon_ctlr_button_mapping {
> +       u32 code;
> +       u32 bit;
> +};
> +
> +/*
> + * D-pad is configured as buttons for the left Joy-Con only!
> + */
> +static const struct joycon_ctlr_button_mapping left_joycon_button_mappin=
gs[] =3D {
> +       { BTN_TL,               JC_BTN_L,       },
> +       { BTN_TL2,              JC_BTN_ZL,      },
> +       { BTN_SELECT,           JC_BTN_MINUS,   },
> +       { BTN_THUMBL,           JC_BTN_LSTICK,  },
> +       { BTN_DPAD_UP,          JC_BTN_UP,      },
> +       { BTN_DPAD_DOWN,        JC_BTN_DOWN,    },
> +       { BTN_DPAD_LEFT,        JC_BTN_LEFT,    },
> +       { BTN_DPAD_RIGHT,       JC_BTN_RIGHT,   },
> +       { BTN_Z,                JC_BTN_CAP,     },
> +       { /* sentinel */ },
> +};
> +
> +/*
> + * The unused *right*-side triggers become the SL/SR triggers for the *l=
eft*
> + * Joy-Con, if and only if we're not using a charging grip.
> + */
> +static const struct joycon_ctlr_button_mapping left_joycon_s_button_mapp=
ings[] =3D {
> +       { BTN_TR,       JC_BTN_SL_L,    },
> +       { BTN_TR2,      JC_BTN_SR_L,    },
> +       { /* sentinel */ },
> +};
> +
> +static const struct joycon_ctlr_button_mapping right_joycon_button_mappi=
ngs[] =3D {
> +       { BTN_EAST,     JC_BTN_A,       },
> +       { BTN_SOUTH,    JC_BTN_B,       },
> +       { BTN_NORTH,    JC_BTN_X,       },
> +       { BTN_WEST,     JC_BTN_Y,       },
> +       { BTN_TR,       JC_BTN_R,       },
> +       { BTN_TR2,      JC_BTN_ZR,      },
> +       { BTN_START,    JC_BTN_PLUS,    },
> +       { BTN_THUMBR,   JC_BTN_RSTICK,  },
> +       { BTN_MODE,     JC_BTN_HOME,    },
> +       { /* sentinel */ },
> +};
> +
> +/*
> + * The unused *left*-side triggers become the SL/SR triggers for the *ri=
ght*
> + * Joy-Con, if and only if we're not using a charging grip.
> + */
> +static const struct joycon_ctlr_button_mapping right_joycon_s_button_map=
pings[] =3D {
> +       { BTN_TL,       JC_BTN_SL_R,    },
> +       { BTN_TL2,      JC_BTN_SR_R,    },
> +       { /* sentinel */ },
> +};
> +
> +static const struct joycon_ctlr_button_mapping procon_button_mappings[] =
=3D {
> +       { BTN_EAST,     JC_BTN_A,       },
> +       { BTN_SOUTH,    JC_BTN_B,       },
> +       { BTN_NORTH,    JC_BTN_X,       },
> +       { BTN_WEST,     JC_BTN_Y,       },
> +       { BTN_TL,       JC_BTN_L,       },
> +       { BTN_TR,       JC_BTN_R,       },
> +       { BTN_TL2,      JC_BTN_ZL,      },
> +       { BTN_TR2,      JC_BTN_ZR,      },
> +       { BTN_SELECT,   JC_BTN_MINUS,   },
> +       { BTN_START,    JC_BTN_PLUS,    },
> +       { BTN_THUMBL,   JC_BTN_LSTICK,  },
> +       { BTN_THUMBR,   JC_BTN_RSTICK,  },
> +       { BTN_MODE,     JC_BTN_HOME,    },
> +       { BTN_Z,        JC_BTN_CAP,     },
> +       { /* sentinel */ },
> +};
> +
> +static const struct joycon_ctlr_button_mapping nescon_button_mappings[] =
=3D {
> +       { BTN_SOUTH,    JC_BTN_A,       },
> +       { BTN_EAST,     JC_BTN_B,       },
> +       { BTN_TL,       JC_BTN_L,       },
> +       { BTN_TR,       JC_BTN_R,       },
> +       { BTN_SELECT,   JC_BTN_MINUS,   },
> +       { BTN_START,    JC_BTN_PLUS,    },
> +       { /* sentinel */ },
> +};
> +
> +static const struct joycon_ctlr_button_mapping snescon_button_mappings[]=
 =3D {
> +       { BTN_EAST,     JC_BTN_A,       },
> +       { BTN_SOUTH,    JC_BTN_B,       },
> +       { BTN_NORTH,    JC_BTN_X,       },
> +       { BTN_WEST,     JC_BTN_Y,       },
> +       { BTN_TL,       JC_BTN_L,       },
> +       { BTN_TR,       JC_BTN_R,       },
> +       { BTN_TL2,      JC_BTN_ZL,      },
> +       { BTN_TR2,      JC_BTN_ZR,      },
> +       { BTN_SELECT,   JC_BTN_MINUS,   },
> +       { BTN_START,    JC_BTN_PLUS,    },
> +       { /* sentinel */ },
> +};
> +
> +/*
> + * "A", "B", and "C" are mapped positionally, rather than by label (e.g.=
, "A"
> + * gets assigned to BTN_EAST instead of BTN_A).
> + */
> +static const struct joycon_ctlr_button_mapping gencon_button_mappings[] =
=3D {
> +       { BTN_SOUTH,    JC_BTN_A,       },
> +       { BTN_EAST,     JC_BTN_B,       },
> +       { BTN_WEST,     JC_BTN_R,       },
> +       { BTN_SELECT,   JC_BTN_ZR,      },
> +       { BTN_START,    JC_BTN_PLUS,    },
> +       { BTN_MODE,     JC_BTN_HOME,    },
> +       { BTN_Z,        JC_BTN_CAP,     },
> +       { /* sentinel */ },
> +};
> +
> +/*
> + * N64's C buttons get assigned to d-pad directions and registered as bu=
ttons.
> + */
> +static const struct joycon_ctlr_button_mapping n64con_button_mappings[] =
=3D {
> +       { BTN_A,                JC_BTN_A,       },
> +       { BTN_B,                JC_BTN_B,       },
> +       { BTN_TL2,              JC_BTN_ZL,      }, /* Z */
> +       { BTN_TL,               JC_BTN_L,       },
> +       { BTN_TR,               JC_BTN_R,       },
> +       { BTN_TR2,              JC_BTN_LSTICK,  }, /* ZR */
> +       { BTN_START,            JC_BTN_PLUS,    },
> +       { BTN_FORWARD,          JC_BTN_Y,       }, /* C UP */
> +       { BTN_BACK,             JC_BTN_ZR,      }, /* C DOWN */
> +       { BTN_LEFT,             JC_BTN_X,       }, /* C LEFT */
> +       { BTN_RIGHT,            JC_BTN_MINUS,   }, /* C RIGHT */
> +       { BTN_MODE,             JC_BTN_HOME,    },
> +       { BTN_Z,                JC_BTN_CAP,     },
> +       { /* sentinel */ },
> +};
> +
>  enum joycon_msg_type {
>         JOYCON_MSG_TYPE_NONE,
>         JOYCON_MSG_TYPE_USB,
> @@ -506,13 +648,182 @@ struct joycon_ctlr {
>  /* Does this controller have inputs associated with left joycon? */
>  #define jc_type_has_left(ctlr) \
>         (ctlr->ctlr_type =3D=3D JOYCON_CTLR_TYPE_JCL || \
> -        ctlr->ctlr_type =3D=3D JOYCON_CTLR_TYPE_PRO)
> +        ctlr->ctlr_type =3D=3D JOYCON_CTLR_TYPE_PRO || \
> +        ctlr->ctlr_type =3D=3D JOYCON_CTLR_TYPE_N64)
>
>  /* Does this controller have inputs associated with right joycon? */
>  #define jc_type_has_right(ctlr) \
>         (ctlr->ctlr_type =3D=3D JOYCON_CTLR_TYPE_JCR || \
>          ctlr->ctlr_type =3D=3D JOYCON_CTLR_TYPE_PRO)
>
> +
> +/*
> + * Controller device helpers
> + *
> + * These look at the device ID known to the HID subsystem to identify a =
device,
> + * but take caution: some NSO devices lie about themselves (NES Joy-Cons=
 and
> + * Sega Genesis controller). See type helpers below.
> + *
> + * These helpers are most useful early during the HID probe or in conjun=
ction
> + * with the capability helpers below.
> + */
> +static inline bool joycon_device_is_left_joycon(struct joycon_ctlr *ctlr=
)
> +{
> +       return ctlr->hdev->product =3D=3D USB_DEVICE_ID_NINTENDO_JOYCONL;
> +}
> +
> +static inline bool joycon_device_is_right_joycon(struct joycon_ctlr *ctl=
r)
> +{
> +       return ctlr->hdev->product =3D=3D USB_DEVICE_ID_NINTENDO_JOYCONR;
> +}
> +
> +static inline bool joycon_device_is_procon(struct joycon_ctlr *ctlr)
> +{
> +       return ctlr->hdev->product =3D=3D USB_DEVICE_ID_NINTENDO_PROCON;
> +}
> +
> +static inline bool joycon_device_is_chrggrip(struct joycon_ctlr *ctlr)
> +{
> +       return ctlr->hdev->product =3D=3D USB_DEVICE_ID_NINTENDO_CHRGGRIP=
;
> +}
> +
> +static inline bool joycon_device_is_snescon(struct joycon_ctlr *ctlr)
> +{
> +       return ctlr->hdev->product =3D=3D USB_DEVICE_ID_NINTENDO_SNESCON;
> +}
> +
> +static inline bool joycon_device_is_gencon(struct joycon_ctlr *ctlr)
> +{
> +       return ctlr->hdev->product =3D=3D USB_DEVICE_ID_NINTENDO_GENCON;
> +}
> +
> +static inline bool joycon_device_is_n64con(struct joycon_ctlr *ctlr)
> +{
> +       return ctlr->hdev->product =3D=3D USB_DEVICE_ID_NINTENDO_N64CON;
> +}
> +
> +static inline bool joycon_device_has_usb(struct joycon_ctlr *ctlr)
> +{
> +       return joycon_device_is_procon(ctlr) ||
> +              joycon_device_is_chrggrip(ctlr) ||
> +              joycon_device_is_snescon(ctlr) ||
> +              joycon_device_is_gencon(ctlr) ||
> +              joycon_device_is_n64con(ctlr);
> +}
> +
> +/*
> + * Controller type helpers
> + *
> + * These are slightly different than the device-ID-based helpers above. =
They are
> + * generally more reliable, since they can distinguish between, e.g., Ge=
nesis
> + * versus SNES, or NES Joy-Cons versus regular Switch Joy-Cons. They're =
most
> + * useful for reporting available inputs. For other kinds of distinction=
s, see
> + * the capability helpers below.
> + *
> + * They have two major drawbacks: (1) they're not available until after =
we set
> + * the reporting method and then request the device info; (2) they can't
> + * distinguish all controllers (like the Charging Grip from the Pro cont=
roller.)
> + */
> +static inline bool joycon_type_is_left_joycon(struct joycon_ctlr *ctlr)
> +{
> +       return ctlr->ctlr_type =3D=3D JOYCON_CTLR_TYPE_JCL;
> +}
> +
> +static inline bool joycon_type_is_right_joycon(struct joycon_ctlr *ctlr)
> +{
> +       return ctlr->ctlr_type =3D=3D JOYCON_CTLR_TYPE_JCR;
> +}
> +
> +static inline bool joycon_type_is_procon(struct joycon_ctlr *ctlr)
> +{
> +       return ctlr->ctlr_type =3D=3D JOYCON_CTLR_TYPE_PRO;
> +}
> +
> +static inline bool joycon_type_is_snescon(struct joycon_ctlr *ctlr)
> +{
> +       return ctlr->ctlr_type =3D=3D JOYCON_CTLR_TYPE_SNES;
> +}
> +
> +static inline bool joycon_type_is_gencon(struct joycon_ctlr *ctlr)
> +{
> +       return ctlr->ctlr_type =3D=3D JOYCON_CTLR_TYPE_GEN;
> +}
> +
> +static inline bool joycon_type_is_n64con(struct joycon_ctlr *ctlr)
> +{
> +       return ctlr->ctlr_type =3D=3D JOYCON_CTLR_TYPE_N64;
> +}
> +
> +static inline bool joycon_type_is_left_nescon(struct joycon_ctlr *ctlr)
> +{
> +       return ctlr->ctlr_type =3D=3D JOYCON_CTLR_TYPE_NESL;
> +}
> +
> +static inline bool joycon_type_is_right_nescon(struct joycon_ctlr *ctlr)
> +{
> +       return ctlr->ctlr_type =3D=3D JOYCON_CTLR_TYPE_NESR;
> +}
> +
> +static inline bool joycon_type_has_left_controls(struct joycon_ctlr *ctl=
r)
> +{
> +       return joycon_type_is_left_joycon(ctlr) ||
> +              joycon_type_is_procon(ctlr);
> +}
> +
> +static inline bool joycon_type_has_right_controls(struct joycon_ctlr *ct=
lr)
> +{
> +       return joycon_type_is_right_joycon(ctlr) ||
> +              joycon_type_is_procon(ctlr);
> +}
> +
> +static inline bool joycon_type_is_any_joycon(struct joycon_ctlr *ctlr)
> +{
> +       return joycon_type_is_left_joycon(ctlr) ||
> +              joycon_type_is_right_joycon(ctlr) ||
> +              joycon_device_is_chrggrip(ctlr);
> +}
> +
> +static inline bool joycon_type_is_any_nescon(struct joycon_ctlr *ctlr)
> +{
> +       return joycon_type_is_left_nescon(ctlr) ||
> +              joycon_type_is_right_nescon(ctlr);
> +}
> +
> +/*
> + * Controller capability helpers
> + *
> + * These helpers combine the use of the helpers above to detect certain
> + * capabilities during initialization. They are always accurate but (sin=
ce they
> + * use type helpers) cannot be used early in the HID probe.
> + */
> +static inline bool joycon_has_imu(struct joycon_ctlr *ctlr)
> +{
> +       return joycon_device_is_chrggrip(ctlr) ||
> +              joycon_type_is_any_joycon(ctlr) ||
> +              joycon_type_is_procon(ctlr);
> +}
> +
> +static inline bool joycon_has_joysticks(struct joycon_ctlr *ctlr)
> +{
> +       return joycon_device_is_chrggrip(ctlr) ||
> +              joycon_type_is_any_joycon(ctlr) ||
> +              joycon_type_is_procon(ctlr) ||
> +              joycon_type_is_n64con(ctlr);
> +}
> +
> +static inline bool joycon_has_rumble(struct joycon_ctlr *ctlr)
> +{
> +       return joycon_device_is_chrggrip(ctlr) ||
> +              joycon_type_is_any_joycon(ctlr) ||
> +              joycon_type_is_procon(ctlr) ||
> +              joycon_type_is_n64con(ctlr);
> +}
> +
> +static inline bool joycon_using_usb(struct joycon_ctlr *ctlr)
> +{
> +       return ctlr->hdev->bus =3D=3D BUS_USB;
> +}
> +
>  static int __joycon_hid_send(struct hid_device *hdev, u8 *data, size_t l=
en)
>  {
>         u8 *buf;
> @@ -1283,15 +1594,10 @@ static void joycon_parse_imu_report(struct joycon=
_ctlr *ctlr,
>         }
>  }
>
> -static void joycon_parse_report(struct joycon_ctlr *ctlr,
> -                               struct joycon_input_report *rep)
> +static void joycon_handle_rumble_report(struct joycon_ctlr *ctlr, struct=
 joycon_input_report *rep)
>  {
> -       struct input_dev *dev =3D ctlr->input;
>         unsigned long flags;
> -       u8 tmp;
> -       u32 btns;
>         unsigned long msecs =3D jiffies_to_msecs(jiffies);
> -       unsigned long report_delta_ms =3D msecs - ctlr->last_input_report=
_msecs;
>
>         spin_lock_irqsave(&ctlr->lock, flags);
>         if (IS_ENABLED(CONFIG_NINTENDO_FF) && rep->vibrator_report &&
> @@ -1310,11 +1616,21 @@ static void joycon_parse_report(struct joycon_ctl=
r *ctlr,
>                 queue_work(ctlr->rumble_queue, &ctlr->rumble_worker);
>         }
>
> -       /* Parse the battery status */
> +       spin_unlock_irqrestore(&ctlr->lock, flags);
> +}
> +
> +static void joycon_parse_battery_status(struct joycon_ctlr *ctlr, struct=
 joycon_input_report *rep)
> +{
> +       u8 tmp;
> +       unsigned long flags;
> +
> +       spin_lock_irqsave(&ctlr->lock, flags);
> +
>         tmp =3D rep->bat_con;
>         ctlr->host_powered =3D tmp & BIT(0);
>         ctlr->battery_charging =3D tmp & BIT(4);
>         tmp =3D tmp >> 5;
> +
>         switch (tmp) {
>         case 0: /* empty */
>                 ctlr->battery_capacity =3D POWER_SUPPLY_CAPACITY_LEVEL_CR=
ITICAL;
> @@ -1336,102 +1652,121 @@ static void joycon_parse_report(struct joycon_c=
tlr *ctlr,
>                 hid_warn(ctlr->hdev, "Invalid battery status\n");
>                 break;
>         }
> +
>         spin_unlock_irqrestore(&ctlr->lock, flags);
> +}
>
> -       /* Parse the buttons and sticks */
> -       btns =3D hid_field_extract(ctlr->hdev, rep->button_status, 0, 24)=
;
> -
> -       if (jc_type_has_left(ctlr)) {
> -               u16 raw_x;
> -               u16 raw_y;
> -               s32 x;
> -               s32 y;
> -
> -               /* get raw stick values */
> -               raw_x =3D hid_field_extract(ctlr->hdev, rep->left_stick, =
0, 12);
> -               raw_y =3D hid_field_extract(ctlr->hdev,
> -                                         rep->left_stick + 1, 4, 12);
> -               /* map the stick values */
> -               x =3D joycon_map_stick_val(&ctlr->left_stick_cal_x, raw_x=
);
> -               y =3D -joycon_map_stick_val(&ctlr->left_stick_cal_y, raw_=
y);
> -               /* report sticks */
> -               input_report_abs(dev, ABS_X, x);
> -               input_report_abs(dev, ABS_Y, y);
> -
> -               /* report buttons */
> -               input_report_key(dev, BTN_TL, btns & JC_BTN_L);
> -               input_report_key(dev, BTN_TL2, btns & JC_BTN_ZL);
> -               input_report_key(dev, BTN_SELECT, btns & JC_BTN_MINUS);
> -               input_report_key(dev, BTN_THUMBL, btns & JC_BTN_LSTICK);
> -               input_report_key(dev, BTN_Z, btns & JC_BTN_CAP);
> -
> -               if (jc_type_is_joycon(ctlr)) {
> -                       /* Report the S buttons as the non-existent trigg=
ers */
> -                       input_report_key(dev, BTN_TR, btns & JC_BTN_SL_L)=
;
> -                       input_report_key(dev, BTN_TR2, btns & JC_BTN_SR_L=
);
> -
> -                       /* Report d-pad as digital buttons for the joy-co=
ns */
> -                       input_report_key(dev, BTN_DPAD_DOWN,
> -                                        btns & JC_BTN_DOWN);
> -                       input_report_key(dev, BTN_DPAD_UP, btns & JC_BTN_=
UP);
> -                       input_report_key(dev, BTN_DPAD_RIGHT,
> -                                        btns & JC_BTN_RIGHT);
> -                       input_report_key(dev, BTN_DPAD_LEFT,
> -                                        btns & JC_BTN_LEFT);
> -               } else {
> -                       int hatx =3D 0;
> -                       int haty =3D 0;
> -
> -                       /* d-pad x */
> -                       if (btns & JC_BTN_LEFT)
> -                               hatx =3D -1;
> -                       else if (btns & JC_BTN_RIGHT)
> -                               hatx =3D 1;
> -                       input_report_abs(dev, ABS_HAT0X, hatx);
> -
> -                       /* d-pad y */
> -                       if (btns & JC_BTN_UP)
> -                               haty =3D -1;
> -                       else if (btns & JC_BTN_DOWN)
> -                               haty =3D 1;
> -                       input_report_abs(dev, ABS_HAT0Y, haty);
> -               }
> -       }
> -       if (jc_type_has_right(ctlr)) {
> -               u16 raw_x;
> -               u16 raw_y;
> -               s32 x;
> -               s32 y;
> -
> -               /* get raw stick values */
> -               raw_x =3D hid_field_extract(ctlr->hdev, rep->right_stick,=
 0, 12);
> -               raw_y =3D hid_field_extract(ctlr->hdev,
> -                                         rep->right_stick + 1, 4, 12);
> -               /* map stick values */
> -               x =3D joycon_map_stick_val(&ctlr->right_stick_cal_x, raw_=
x);
> -               y =3D -joycon_map_stick_val(&ctlr->right_stick_cal_y, raw=
_y);
> -               /* report sticks */
> -               input_report_abs(dev, ABS_RX, x);
> -               input_report_abs(dev, ABS_RY, y);
> -
> -               /* report buttons */
> -               input_report_key(dev, BTN_TR, btns & JC_BTN_R);
> -               input_report_key(dev, BTN_TR2, btns & JC_BTN_ZR);
> -               if (jc_type_is_joycon(ctlr)) {
> -                       /* Report the S buttons as the non-existent trigg=
ers */
> -                       input_report_key(dev, BTN_TL, btns & JC_BTN_SL_R)=
;
> -                       input_report_key(dev, BTN_TL2, btns & JC_BTN_SR_R=
);
> -               }
> -               input_report_key(dev, BTN_START, btns & JC_BTN_PLUS);
> -               input_report_key(dev, BTN_THUMBR, btns & JC_BTN_RSTICK);
> -               input_report_key(dev, BTN_MODE, btns & JC_BTN_HOME);
> -               input_report_key(dev, BTN_WEST, btns & JC_BTN_Y);
> -               input_report_key(dev, BTN_NORTH, btns & JC_BTN_X);
> -               input_report_key(dev, BTN_EAST, btns & JC_BTN_A);
> -               input_report_key(dev, BTN_SOUTH, btns & JC_BTN_B);
> +static void joycon_report_left_stick(struct joycon_ctlr *ctlr,
> +                                    struct joycon_input_report *rep)
> +{
> +       u16 raw_x;
> +       u16 raw_y;
> +       s32 x;
> +       s32 y;
> +
> +       raw_x =3D hid_field_extract(ctlr->hdev, rep->left_stick, 0, 12);
> +       raw_y =3D hid_field_extract(ctlr->hdev, rep->left_stick + 1, 4, 1=
2);
> +
> +       x =3D joycon_map_stick_val(&ctlr->left_stick_cal_x, raw_x);
> +       y =3D -joycon_map_stick_val(&ctlr->left_stick_cal_y, raw_y);
> +
> +       input_report_abs(ctlr->input, ABS_X, x);
> +       input_report_abs(ctlr->input, ABS_Y, y);
> +}
> +
> +static void joycon_report_right_stick(struct joycon_ctlr *ctlr,
> +                                     struct joycon_input_report *rep)
> +{
> +       u16 raw_x;
> +       u16 raw_y;
> +       s32 x;
> +       s32 y;
> +
> +       raw_x =3D hid_field_extract(ctlr->hdev, rep->right_stick, 0, 12);
> +       raw_y =3D hid_field_extract(ctlr->hdev, rep->right_stick + 1, 4, =
12);
> +
> +       x =3D joycon_map_stick_val(&ctlr->right_stick_cal_x, raw_x);
> +       y =3D -joycon_map_stick_val(&ctlr->right_stick_cal_y, raw_y);
> +
> +       input_report_abs(ctlr->input, ABS_RX, x);
> +       input_report_abs(ctlr->input, ABS_RY, y);
> +}
> +
> +static void joycon_report_dpad(struct joycon_ctlr *ctlr,
> +                              struct joycon_input_report *rep)
> +{
> +       int hatx =3D 0;
> +       int haty =3D 0;
> +       u32 btns =3D hid_field_extract(ctlr->hdev, rep->button_status, 0,=
 24);
> +
> +       if (btns & JC_BTN_LEFT)
> +               hatx =3D -1;
> +       else if (btns & JC_BTN_RIGHT)
> +               hatx =3D 1;
> +
> +       if (btns & JC_BTN_UP)
> +               haty =3D -1;
> +       else if (btns & JC_BTN_DOWN)
> +               haty =3D 1;
> +
> +       input_report_abs(ctlr->input, ABS_HAT0X, hatx);
> +       input_report_abs(ctlr->input, ABS_HAT0Y, haty);
> +}
> +
> +static void joycon_report_buttons(struct joycon_ctlr *ctlr,
> +                                 struct joycon_input_report *rep,
> +                                 const struct joycon_ctlr_button_mapping=
 button_mappings[])
> +{
> +       const struct joycon_ctlr_button_mapping *button;
> +       u32 status =3D hid_field_extract(ctlr->hdev, rep->button_status, =
0, 24);
> +
> +       for (button =3D button_mappings; button->code; button++)
> +               input_report_key(ctlr->input, button->code, status & butt=
on->bit);
> +}
> +
> +static void joycon_parse_report(struct joycon_ctlr *ctlr,
> +                               struct joycon_input_report *rep)
> +{
> +       unsigned long flags;
> +       unsigned long msecs =3D jiffies_to_msecs(jiffies);
> +       unsigned long report_delta_ms =3D msecs - ctlr->last_input_report=
_msecs;
> +
> +       if (joycon_has_rumble(ctlr))
> +               joycon_handle_rumble_report(ctlr, rep);
> +
> +       joycon_parse_battery_status(ctlr, rep);
> +
> +       if (joycon_type_is_left_joycon(ctlr)) {
> +               joycon_report_left_stick(ctlr, rep);
> +               joycon_report_buttons(ctlr, rep, left_joycon_button_mappi=
ngs);
> +               if (!joycon_device_is_chrggrip(ctlr))
> +                       joycon_report_buttons(ctlr, rep, left_joycon_s_bu=
tton_mappings);
> +       } else if (joycon_type_is_right_joycon(ctlr)) {
> +               joycon_report_right_stick(ctlr, rep);
> +               joycon_report_buttons(ctlr, rep, right_joycon_button_mapp=
ings);
> +               if (!joycon_device_is_chrggrip(ctlr))
> +                       joycon_report_buttons(ctlr, rep, right_joycon_s_b=
utton_mappings);
> +       } else if (joycon_type_is_procon(ctlr)) {
> +               joycon_report_left_stick(ctlr, rep);
> +               joycon_report_right_stick(ctlr, rep);
> +               joycon_report_dpad(ctlr, rep);
> +               joycon_report_buttons(ctlr, rep, procon_button_mappings);
> +       } else if (joycon_type_is_any_nescon(ctlr)) {
> +               joycon_report_dpad(ctlr, rep);
> +               joycon_report_buttons(ctlr, rep, nescon_button_mappings);
> +       } else if (joycon_type_is_snescon(ctlr)) {
> +               joycon_report_dpad(ctlr, rep);
> +               joycon_report_buttons(ctlr, rep, snescon_button_mappings)=
;
> +       } else if (joycon_type_is_gencon(ctlr)) {
> +               joycon_report_dpad(ctlr, rep);
> +               joycon_report_buttons(ctlr, rep, gencon_button_mappings);
> +       } else if (joycon_type_is_n64con(ctlr)) {
> +               joycon_report_left_stick(ctlr, rep);
> +               joycon_report_dpad(ctlr, rep);
> +               joycon_report_buttons(ctlr, rep, n64con_button_mappings);
>         }
>
> -       input_sync(dev);
> +       input_sync(ctlr->input);
>
>         spin_lock_irqsave(&ctlr->lock, flags);
>         ctlr->last_input_report_msecs =3D msecs;
> @@ -1471,7 +1806,7 @@ static void joycon_parse_report(struct joycon_ctlr =
*ctlr,
>         }
>
>         /* parse IMU data if present */
> -       if (rep->id =3D=3D JC_INPUT_IMU_DATA)
> +       if ((rep->id =3D=3D JC_INPUT_IMU_DATA) && joycon_has_imu(ctlr))
>                 joycon_parse_imu_report(ctlr, rep);
>  }
>
> @@ -1684,123 +2019,65 @@ static int joycon_play_effect(struct input_dev *=
dev, void *data,
>  }
>  #endif /* IS_ENABLED(CONFIG_NINTENDO_FF) */
>
> -static const unsigned int joycon_button_inputs_l[] =3D {
> -       BTN_SELECT, BTN_Z, BTN_THUMBL,
> -       BTN_TL, BTN_TL2,
> -       0 /* 0 signals end of array */
> -};
> -
> -static const unsigned int joycon_button_inputs_r[] =3D {
> -       BTN_START, BTN_MODE, BTN_THUMBR,
> -       BTN_SOUTH, BTN_EAST, BTN_NORTH, BTN_WEST,
> -       BTN_TR, BTN_TR2,
> -       0 /* 0 signals end of array */
> -};
> -
> -/* We report joy-con d-pad inputs as buttons and pro controller as a hat=
. */
> -static const unsigned int joycon_dpad_inputs_jc[] =3D {
> -       BTN_DPAD_UP, BTN_DPAD_DOWN, BTN_DPAD_LEFT, BTN_DPAD_RIGHT,
> -       0 /* 0 signals end of array */
> -};
> -
> -static int joycon_input_create(struct joycon_ctlr *ctlr)
> +static void joycon_config_left_stick(struct input_dev *idev)
>  {
> -       struct hid_device *hdev;
> -       const char *name;
> -       const char *imu_name;
> -       int ret;
> -       int i;
> -
> -       hdev =3D ctlr->hdev;
> +       input_set_abs_params(idev,
> +                            ABS_X,
> +                            -JC_MAX_STICK_MAG,
> +                            JC_MAX_STICK_MAG,
> +                            JC_STICK_FUZZ,
> +                            JC_STICK_FLAT);
> +       input_set_abs_params(idev,
> +                            ABS_Y,
> +                            -JC_MAX_STICK_MAG,
> +                            JC_MAX_STICK_MAG,
> +                            JC_STICK_FUZZ,
> +                            JC_STICK_FLAT);
> +}
>
> -       switch (hdev->product) {
> -       case USB_DEVICE_ID_NINTENDO_PROCON:
> -               name =3D "Nintendo Switch Pro Controller";
> -               imu_name =3D "Nintendo Switch Pro Controller IMU";
> -               break;
> -       case USB_DEVICE_ID_NINTENDO_CHRGGRIP:
> -               if (jc_type_has_left(ctlr)) {
> -                       name =3D "Nintendo Switch Left Joy-Con (Grip)";
> -                       imu_name =3D "Nintendo Switch Left Joy-Con IMU (G=
rip)";
> -               } else {
> -                       name =3D "Nintendo Switch Right Joy-Con (Grip)";
> -                       imu_name =3D "Nintendo Switch Right Joy-Con IMU (=
Grip)";
> -               }
> -               break;
> -       case USB_DEVICE_ID_NINTENDO_JOYCONL:
> -               name =3D "Nintendo Switch Left Joy-Con";
> -               imu_name =3D "Nintendo Switch Left Joy-Con IMU";
> -               break;
> -       case USB_DEVICE_ID_NINTENDO_JOYCONR:
> -               name =3D "Nintendo Switch Right Joy-Con";
> -               imu_name =3D "Nintendo Switch Right Joy-Con IMU";
> -               break;
> -       default: /* Should be impossible */
> -               hid_err(hdev, "Invalid hid product\n");
> -               return -EINVAL;
> -       }
> +static void joycon_config_right_stick(struct input_dev *idev)
> +{
> +       input_set_abs_params(idev,
> +                            ABS_RX,
> +                            -JC_MAX_STICK_MAG,
> +                            JC_MAX_STICK_MAG,
> +                            JC_STICK_FUZZ,
> +                            JC_STICK_FLAT);
> +       input_set_abs_params(idev,
> +                            ABS_RY,
> +                            -JC_MAX_STICK_MAG,
> +                            JC_MAX_STICK_MAG,
> +                            JC_STICK_FUZZ,
> +                            JC_STICK_FLAT);
> +}
>
> -       ctlr->input =3D devm_input_allocate_device(&hdev->dev);
> -       if (!ctlr->input)
> -               return -ENOMEM;
> -       ctlr->input->id.bustype =3D hdev->bus;
> -       ctlr->input->id.vendor =3D hdev->vendor;
> -       ctlr->input->id.product =3D hdev->product;
> -       ctlr->input->id.version =3D hdev->version;
> -       ctlr->input->uniq =3D ctlr->mac_addr_str;
> -       ctlr->input->name =3D name;
> -       ctlr->input->phys =3D hdev->phys;
> -       input_set_drvdata(ctlr->input, ctlr);
> +static void joycon_config_dpad(struct input_dev *idev)
> +{
> +       input_set_abs_params(idev,
> +                            ABS_HAT0X,
> +                            -JC_MAX_DPAD_MAG,
> +                            JC_MAX_DPAD_MAG,
> +                            JC_DPAD_FUZZ,
> +                            JC_DPAD_FLAT);
> +       input_set_abs_params(idev,
> +                            ABS_HAT0Y,
> +                            -JC_MAX_DPAD_MAG,
> +                            JC_MAX_DPAD_MAG,
> +                            JC_DPAD_FUZZ,
> +                            JC_DPAD_FLAT);
> +}
>
> -       /* set up sticks and buttons */
> -       if (jc_type_has_left(ctlr)) {
> -               input_set_abs_params(ctlr->input, ABS_X,
> -                                    -JC_MAX_STICK_MAG, JC_MAX_STICK_MAG,
> -                                    JC_STICK_FUZZ, JC_STICK_FLAT);
> -               input_set_abs_params(ctlr->input, ABS_Y,
> -                                    -JC_MAX_STICK_MAG, JC_MAX_STICK_MAG,
> -                                    JC_STICK_FUZZ, JC_STICK_FLAT);
> -
> -               for (i =3D 0; joycon_button_inputs_l[i] > 0; i++)
> -                       input_set_capability(ctlr->input, EV_KEY,
> -                                            joycon_button_inputs_l[i]);
> -
> -               /* configure d-pad differently for joy-con vs pro control=
ler */
> -               if (hdev->product !=3D USB_DEVICE_ID_NINTENDO_PROCON) {
> -                       for (i =3D 0; joycon_dpad_inputs_jc[i] > 0; i++)
> -                               input_set_capability(ctlr->input, EV_KEY,
> -                                                    joycon_dpad_inputs_j=
c[i]);
> -               } else {
> -                       input_set_abs_params(ctlr->input, ABS_HAT0X,
> -                                            -JC_MAX_DPAD_MAG, JC_MAX_DPA=
D_MAG,
> -                                            JC_DPAD_FUZZ, JC_DPAD_FLAT);
> -                       input_set_abs_params(ctlr->input, ABS_HAT0Y,
> -                                            -JC_MAX_DPAD_MAG, JC_MAX_DPA=
D_MAG,
> -                                            JC_DPAD_FUZZ, JC_DPAD_FLAT);
> -               }
> -       }
> -       if (jc_type_has_right(ctlr)) {
> -               input_set_abs_params(ctlr->input, ABS_RX,
> -                                    -JC_MAX_STICK_MAG, JC_MAX_STICK_MAG,
> -                                    JC_STICK_FUZZ, JC_STICK_FLAT);
> -               input_set_abs_params(ctlr->input, ABS_RY,
> -                                    -JC_MAX_STICK_MAG, JC_MAX_STICK_MAG,
> -                                    JC_STICK_FUZZ, JC_STICK_FLAT);
> -
> -               for (i =3D 0; joycon_button_inputs_r[i] > 0; i++)
> -                       input_set_capability(ctlr->input, EV_KEY,
> -                                            joycon_button_inputs_r[i]);
> -       }
> +static void joycon_config_buttons(struct input_dev *idev,
> +                const struct joycon_ctlr_button_mapping button_mappings[=
])
> +{
> +       const struct joycon_ctlr_button_mapping *button;
>
> -       /* Let's report joy-con S triggers separately */
> -       if (hdev->product =3D=3D USB_DEVICE_ID_NINTENDO_JOYCONL) {
> -               input_set_capability(ctlr->input, EV_KEY, BTN_TR);
> -               input_set_capability(ctlr->input, EV_KEY, BTN_TR2);
> -       } else if (hdev->product =3D=3D USB_DEVICE_ID_NINTENDO_JOYCONR) {
> -               input_set_capability(ctlr->input, EV_KEY, BTN_TL);
> -               input_set_capability(ctlr->input, EV_KEY, BTN_TL2);
> -       }
> +       for (button =3D button_mappings; button->code; button++)
> +               input_set_capability(idev, EV_KEY, button->code);
> +}
>
> +static void joycon_config_rumble(struct joycon_ctlr *ctlr)
> +{
>  #if IS_ENABLED(CONFIG_NINTENDO_FF)
>         /* set up rumble */
>         input_set_capability(ctlr->input, EV_FF, FF_RUMBLE);
> @@ -1813,10 +2090,15 @@ static int joycon_input_create(struct joycon_ctlr=
 *ctlr)
>         joycon_set_rumble(ctlr, 0, 0, false);
>         ctlr->rumble_msecs =3D jiffies_to_msecs(jiffies);
>  #endif
> +}
>
> -       ret =3D input_register_device(ctlr->input);
> -       if (ret)
> -               return ret;
> +static int joycon_imu_input_create(struct joycon_ctlr *ctlr)
> +{
> +       struct hid_device *hdev;
> +       const char *imu_name;
> +       int ret;
> +
> +       hdev =3D ctlr->hdev;
>
>         /* configure the imu input device */
>         ctlr->imu_input =3D devm_input_allocate_device(&hdev->dev);
> @@ -1828,8 +2110,14 @@ static int joycon_input_create(struct joycon_ctlr =
*ctlr)
>         ctlr->imu_input->id.product =3D hdev->product;
>         ctlr->imu_input->id.version =3D hdev->version;
>         ctlr->imu_input->uniq =3D ctlr->mac_addr_str;
> -       ctlr->imu_input->name =3D imu_name;
>         ctlr->imu_input->phys =3D hdev->phys;
> +
> +       imu_name =3D devm_kasprintf(&hdev->dev, GFP_KERNEL, "%s (IMU)", c=
tlr->input->name);
> +       if (!imu_name)
> +               return -ENOMEM;
> +
> +       ctlr->imu_input->name =3D imu_name;
> +
>         input_set_drvdata(ctlr->imu_input, ctlr);
>
>         /* configure imu axes */
> @@ -1871,6 +2159,71 @@ static int joycon_input_create(struct joycon_ctlr =
*ctlr)
>         return 0;
>  }
>
> +static int joycon_input_create(struct joycon_ctlr *ctlr)
> +{
> +       struct hid_device *hdev;
> +       int ret;
> +
> +       hdev =3D ctlr->hdev;
> +
> +       ctlr->input =3D devm_input_allocate_device(&hdev->dev);
> +       if (!ctlr->input)
> +               return -ENOMEM;
> +       ctlr->input->id.bustype =3D hdev->bus;
> +       ctlr->input->id.vendor =3D hdev->vendor;
> +       ctlr->input->id.product =3D hdev->product;
> +       ctlr->input->id.version =3D hdev->version;
> +       ctlr->input->uniq =3D ctlr->mac_addr_str;
> +       ctlr->input->name =3D hdev->name;
> +       ctlr->input->phys =3D hdev->phys;
> +       input_set_drvdata(ctlr->input, ctlr);
> +
> +       ret =3D input_register_device(ctlr->input);
> +       if (ret)
> +               return ret;
> +
> +       if (joycon_type_is_right_joycon(ctlr)) {
> +               joycon_config_right_stick(ctlr->input);
> +               joycon_config_buttons(ctlr->input, right_joycon_button_ma=
ppings);
> +               if (!joycon_device_is_chrggrip(ctlr))
> +                       joycon_config_buttons(ctlr->input, right_joycon_s=
_button_mappings);
> +       } else if (joycon_type_is_left_joycon(ctlr)) {
> +               joycon_config_left_stick(ctlr->input);
> +               joycon_config_buttons(ctlr->input, left_joycon_button_map=
pings);
> +               if (!joycon_device_is_chrggrip(ctlr))
> +                       joycon_config_buttons(ctlr->input, left_joycon_s_=
button_mappings);
> +       } else if (joycon_type_is_procon(ctlr)) {
> +               joycon_config_left_stick(ctlr->input);
> +               joycon_config_right_stick(ctlr->input);
> +               joycon_config_dpad(ctlr->input);
> +               joycon_config_buttons(ctlr->input, procon_button_mappings=
);
> +       } else if (joycon_type_is_any_nescon(ctlr)) {
> +               joycon_config_dpad(ctlr->input);
> +               joycon_config_buttons(ctlr->input, nescon_button_mappings=
);
> +       } else if (joycon_type_is_snescon(ctlr)) {
> +               joycon_config_dpad(ctlr->input);
> +               joycon_config_buttons(ctlr->input, snescon_button_mapping=
s);
> +       } else if (joycon_type_is_gencon(ctlr)) {
> +               joycon_config_dpad(ctlr->input);
> +               joycon_config_buttons(ctlr->input, gencon_button_mappings=
);
> +       } else if (joycon_type_is_n64con(ctlr)) {
> +               joycon_config_dpad(ctlr->input);
> +               joycon_config_left_stick(ctlr->input);
> +               joycon_config_buttons(ctlr->input, n64con_button_mappings=
);
> +       }
> +
> +       if (joycon_has_imu(ctlr)) {
> +               ret =3D joycon_imu_input_create(ctlr);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       if (joycon_has_rumble(ctlr))
> +               joycon_config_rumble(ctlr);
> +
> +       return 0;
> +}
> +
>  /* Because the subcommand sets all the leds at once, the brightness argu=
ment is ignored */
>  static int joycon_player_led_brightness_set(struct led_classdev *led,
>                                             enum led_brightness brightnes=
s)
> @@ -2107,9 +2460,7 @@ static int joycon_read_info(struct joycon_ctlr *ctl=
r)
>         struct joycon_input_report *report;
>
>         req.subcmd_id =3D JC_SUBCMD_REQ_DEV_INFO;
> -       mutex_lock(&ctlr->output_mutex);
>         ret =3D joycon_send_subcmd(ctlr, &req, 0, HZ);
> -       mutex_unlock(&ctlr->output_mutex);
>         if (ret) {
>                 hid_err(ctlr->hdev, "Failed to get joycon info; ret=3D%d\=
n", ret);
>                 return ret;
> @@ -2132,8 +2483,17 @@ static int joycon_read_info(struct joycon_ctlr *ct=
lr)
>                 return -ENOMEM;
>         hid_info(ctlr->hdev, "controller MAC =3D %s\n", ctlr->mac_addr_st=
r);
>
> -       /* Retrieve the type so we can distinguish for charging grip */
> +       /*
> +        * Retrieve the type so we can distinguish the controller type
> +        * Unfortantly the hdev->product can't always be used due to a ?b=
ug?
> +        * with the NSO Genesis controller. Over USB, it will report the
> +        * PID as 0x201E, but over bluetooth it will report the PID as 0x=
2017
> +        * which is the same as the NSO SNES controller. This is differen=
t from
> +        * the rest of the controllers which will report the same PID ove=
r USB
> +        * and bluetooth.
> +        */
>         ctlr->ctlr_type =3D report->subcmd_reply.data[2];
> +       hid_dbg(ctlr->hdev, "controller type =3D 0x%02X\n", ctlr->ctlr_ty=
pe);
>
>         return 0;
>  }
> @@ -2145,8 +2505,7 @@ static int joycon_init(struct hid_device *hdev)
>
>         mutex_lock(&ctlr->output_mutex);
>         /* if handshake command fails, assume ble pro controller */
> -       if ((jc_type_is_procon(ctlr) || jc_type_is_chrggrip(ctlr)) &&
> -           !joycon_send_usb(ctlr, JC_USB_CMD_HANDSHAKE, HZ)) {
> +       if (joycon_using_usb(ctlr) && !joycon_send_usb(ctlr, JC_USB_CMD_H=
ANDSHAKE, HZ)) {
>                 hid_dbg(hdev, "detected USB controller\n");
>                 /* set baudrate for improved latency */
>                 ret =3D joycon_send_usb(ctlr, JC_USB_CMD_BAUDRATE_3M, HZ)=
;
> @@ -2171,24 +2530,43 @@ static int joycon_init(struct hid_device *hdev)
>                 goto out_unlock;
>         }
>
> -       /* get controller calibration data, and parse it */
> -       ret =3D joycon_request_calibration(ctlr);
> +       /* needed to retrieve the controller type */
> +       ret =3D joycon_read_info(ctlr);
>         if (ret) {
> -               /*
> -                * We can function with default calibration, but it may b=
e
> -                * inaccurate. Provide a warning, and continue on.
> -                */
> -               hid_warn(hdev, "Analog stick positions may be inaccurate\=
n");
> +               hid_err(hdev, "Failed to retrieve controller info; ret=3D=
%d\n",
> +                       ret);
> +               goto out_unlock;
>         }
>
> -       /* get IMU calibration data, and parse it */
> -       ret =3D joycon_request_imu_calibration(ctlr);
> -       if (ret) {
> -               /*
> -                * We can function with default calibration, but it may b=
e
> -                * inaccurate. Provide a warning, and continue on.
> -                */
> -               hid_warn(hdev, "Unable to read IMU calibration data\n");
> +       if (joycon_has_joysticks(ctlr)) {
> +               /* get controller calibration data, and parse it */
> +               ret =3D joycon_request_calibration(ctlr);
> +               if (ret) {
> +                       /*
> +                        * We can function with default calibration, but =
it may be
> +                        * inaccurate. Provide a warning, and continue on=
.
> +                        */
> +                       hid_warn(hdev, "Analog stick positions may be ina=
ccurate\n");
> +               }
> +       }
> +
> +       if (joycon_has_imu(ctlr)) {
> +               /* get IMU calibration data, and parse it */
> +               ret =3D joycon_request_imu_calibration(ctlr);
> +               if (ret) {
> +                       /*
> +                        * We can function with default calibration, but =
it may be
> +                        * inaccurate. Provide a warning, and continue on=
.
> +                        */
> +                       hid_warn(hdev, "Unable to read IMU calibration da=
ta\n");
> +               }
> +
> +               /* Enable the IMU */
> +               ret =3D joycon_enable_imu(ctlr);
> +               if (ret) {
> +                       hid_err(hdev, "Failed to enable the IMU; ret=3D%d=
\n", ret);
> +                       goto out_unlock;
> +               }
>         }
>
>         /* Set the reporting mode to 0x30, which is the full report mode =
*/
> @@ -2198,18 +2576,13 @@ static int joycon_init(struct hid_device *hdev)
>                 goto out_unlock;
>         }
>
> -       /* Enable rumble */
> -       ret =3D joycon_enable_rumble(ctlr);
> -       if (ret) {
> -               hid_err(hdev, "Failed to enable rumble; ret=3D%d\n", ret)=
;
> -               goto out_unlock;
> -       }
> -
> -       /* Enable the IMU */
> -       ret =3D joycon_enable_imu(ctlr);
> -       if (ret) {
> -               hid_err(hdev, "Failed to enable the IMU; ret=3D%d\n", ret=
);
> -               goto out_unlock;
> +       if (joycon_has_rumble(ctlr)) {
> +               /* Enable rumble */
> +               ret =3D joycon_enable_rumble(ctlr);
> +               if (ret) {
> +                       hid_err(hdev, "Failed to enable rumble; ret=3D%d\=
n", ret);
> +                       goto out_unlock;
> +               }
>         }
>
>  out_unlock:
> @@ -2354,13 +2727,6 @@ static int nintendo_hid_probe(struct hid_device *h=
dev,
>                 goto err_close;
>         }
>
> -       ret =3D joycon_read_info(ctlr);
> -       if (ret) {
> -               hid_err(hdev, "Failed to retrieve controller info; ret=3D=
%d\n",
> -                       ret);
> -               goto err_close;
> -       }
> -
>         /* Initialize the leds */
>         ret =3D joycon_leds_create(ctlr);
>         if (ret) {
> @@ -2432,6 +2798,12 @@ static int nintendo_hid_resume(struct hid_device *=
hdev)
>  static const struct hid_device_id nintendo_hid_devices[] =3D {
>         { HID_USB_DEVICE(USB_VENDOR_ID_NINTENDO,
>                          USB_DEVICE_ID_NINTENDO_PROCON) },
> +       { HID_USB_DEVICE(USB_VENDOR_ID_NINTENDO,
> +                        USB_DEVICE_ID_NINTENDO_SNESCON) },
> +       { HID_USB_DEVICE(USB_VENDOR_ID_NINTENDO,
> +                        USB_DEVICE_ID_NINTENDO_GENCON) },
> +       { HID_USB_DEVICE(USB_VENDOR_ID_NINTENDO,
> +                        USB_DEVICE_ID_NINTENDO_N64CON) },
>         { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_NINTENDO,
>                          USB_DEVICE_ID_NINTENDO_PROCON) },
>         { HID_USB_DEVICE(USB_VENDOR_ID_NINTENDO,
> @@ -2440,6 +2812,12 @@ static const struct hid_device_id nintendo_hid_dev=
ices[] =3D {
>                          USB_DEVICE_ID_NINTENDO_JOYCONL) },
>         { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_NINTENDO,
>                          USB_DEVICE_ID_NINTENDO_JOYCONR) },
> +       { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_NINTENDO,
> +                        USB_DEVICE_ID_NINTENDO_SNESCON) },
> +       { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_NINTENDO,
> +                        USB_DEVICE_ID_NINTENDO_GENCON) },
> +       { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_NINTENDO,
> +                        USB_DEVICE_ID_NINTENDO_N64CON) },
>         { }
>  };
>  MODULE_DEVICE_TABLE(hid, nintendo_hid_devices);
> @@ -2458,6 +2836,7 @@ static struct hid_driver nintendo_hid_driver =3D {
>  module_hid_driver(nintendo_hid_driver);
>
>  MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Ryan McClelland <rymcclel@gmail.com>");
> +MODULE_AUTHOR("Emily Strickland <linux@emily.st>");
>  MODULE_AUTHOR("Daniel J. Ogorchock <djogorchock@gmail.com>");
>  MODULE_DESCRIPTION("Driver for Nintendo Switch Controllers");
> -
> --
> 2.34.1
>

Thanks a lot for the patch. It's great to have support for the
assortment of Nintendo's switch controller variants in the driver.

The refactor of the button mappings and variant detection looks great to me=
.

I've been able to test successfully on all the HW I have (pro
controller, joycon left, joycon right, joycons in charging grip, N64
controller, and SNES controller). (I don't have the genesis and NES
controller variants to test with).

Reviewed-by: Daniel J. Ogorchock <djogorchock@gmail.com>
Tested-by: Daniel J. Ogorchock <djogorchock@gmail.com>

Thanks,
Daniel

