Return-Path: <linux-input+bounces-2937-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 506D98A170D
	for <lists+linux-input@lfdr.de>; Thu, 11 Apr 2024 16:22:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0F7D1F21803
	for <lists+linux-input@lfdr.de>; Thu, 11 Apr 2024 14:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4636514E2EA;
	Thu, 11 Apr 2024 14:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uYT3ewHB"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512CE14E2DE
	for <linux-input@vger.kernel.org>; Thu, 11 Apr 2024 14:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712845293; cv=none; b=qNOCVO57cxkgom2uju2ja1HDeJuz9OO2Xp4LnFb0q1skPaxz6F2rBBkSN6dpj/xgQMH0a2ANvtOF2I1zrxbw0LwQapwVUcHYQ6OBBvflIQ6ozUbIYVT3iE0gxJjTWcmRIibcROwiv81q9ftzFsC7RO9I6+ZG3l3L6VE0DsWtoSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712845293; c=relaxed/simple;
	bh=9o1G5a7nyFu2OMTsRl3yOSFq/2xlSM0DxhLs99hfRMg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hP2MQWa0V2W9IYZMi5VvmLzqpkDVpD1S0i6GpSidOzigDhxtNVaVLlvnYhbUmRJSZPEk822Xdz4v3vVa1raClYU0brSkGOjVHKX+SH0vBWFffpOuEmejhhIHEbJRmKAqA+e5pe1QfJ1Qr+CveyilV6lmIYaU+rz5Os5bFY+xmqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uYT3ewHB; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dcbef31a9dbso5204211276.1
        for <linux-input@vger.kernel.org>; Thu, 11 Apr 2024 07:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712845289; x=1713450089; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ObHqfuz4DtEn1u/c2lql13Xvs5Y8b35kufCLUHR0kL0=;
        b=uYT3ewHBakKS8o/I35aAGVPbvzYHC6PRdu87oV7Pex7yBvLkL47hYXD1xOHSdE0tmf
         n12VmLL5RYcQ24V/Oy7/TwQewaiSXXoTxJlbwULu8W+a1+QZMhb3QghlKadBcvaN4dpT
         hq43+/7ZNCxrMW6e/0m8xqMjxIZW5C62e3p0OElHhcuQPX3mYS4z5w2utnNLz1ebeMrU
         pY/g9YgDSsHMt2MyBRvDiSAVKG6Bvo/0Vk0vMQc2jEXepLLl63SSzTuJtVoCbpNt1VWc
         XXN/kQ8KVaRzoEFLWf/BP72VcfAiwnYIVlMA/icgr39E6Idtg4wrJlTac9N+Hhbcjyt/
         A8EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712845289; x=1713450089;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ObHqfuz4DtEn1u/c2lql13Xvs5Y8b35kufCLUHR0kL0=;
        b=v5JsAKe5f0Cz29QdoE6GxA4wY9dJwP1ISgPzT4VI6ww4QFfLT/92rjnkdGybpz4DHz
         eIW5WSCpYMR/PN+OPNd007DAxd6wsK2qjwdP2Ldc1UopNoUiS3MKkLWTn4XKW5ODRH79
         oOdOhHEso/P7C6Gv/ErxnhIGQKNqUkZzA3C7vmcatOB4nzWkVSzwsvwF785HaW0z3F7d
         IGyEQFcq56UTWLNEe+zdsrnWTOWEk+RRgTDYkRi1+6k4InpATONX9m5ooqO+Y5BJbf3I
         7v+7uOgZCbh5M55AtXuaoqIQtbvbdbXhP7t6atE62tP5TD2P8R7XhqQHSYj9ixdgp1S0
         PPIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAU03ZPWqQLDdm9bWHbuFIVWr/GIVokTnPDZNX5ZwybJBAj/t4KNJkEBAGS60LQBgTND68UXT1Uf8R4MOKeQ2q1tqDXosPmPLaek0=
X-Gm-Message-State: AOJu0YxfeGuHEMCl+xBKcEBRXBSH+9FvuJ/Tspx2yD2K7E1EJoPiYD3X
	QDHJyuimuExsNsy+G9liUl9Uu5T0sIgkVN1JrnhPoL25jJVGhj0G/att9I39IL8IpYZEnfffQsk
	Igf3JKc9dbj7Y6AcP0UMN1TTCCZvvPZVRGc9RRpxTg1d9j7B9
X-Google-Smtp-Source: AGHT+IEpx91hMYt7batVtxW7oWX3NWCvy5mG9oTmnCAZfBrlmetelWfLHOoxl/QFPFN8cddEB65DYTCx6EwlNum75s0=
X-Received: by 2002:a25:c791:0:b0:dc6:b779:7887 with SMTP id
 w139-20020a25c791000000b00dc6b7797887mr6366554ybe.20.1712845287745; Thu, 11
 Apr 2024 07:21:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240411-pm8xxx-vibrator-new-design-v9-0-7bf56cb92b28@quicinc.com>
 <20240411-pm8xxx-vibrator-new-design-v9-4-7bf56cb92b28@quicinc.com>
 <CAA8EJprJ4s-o1uPiPjRpq4nwG4cdV7K8XMhVLOQn2D=kJLiVzQ@mail.gmail.com> <c2ee9ab0-ecb2-aba2-2cc9-653f74d27396@quicinc.com>
In-Reply-To: <c2ee9ab0-ecb2-aba2-2cc9-653f74d27396@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 11 Apr 2024 17:21:16 +0300
Message-ID: <CAA8EJppJOQ+-XtgJZa01uqYdqXJdfNznR1OUbWua_myzUqNBUA@mail.gmail.com>
Subject: Re: [PATCH v9 4/4] input: pm8xxx-vibrator: add new SPMI vibrator support
To: Fenglin Wu <quic_fenglinw@quicinc.com>
Cc: kernel@quicinc.com, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 11 Apr 2024 at 16:51, Fenglin Wu <quic_fenglinw@quicinc.com> wrote:
>
>
>
> On 2024/4/11 19:02, Dmitry Baryshkov wrote:
> > On Thu, 11 Apr 2024 at 11:32, Fenglin Wu via B4 Relay
> > <devnull+quic_fenglinw.quicinc.com@kernel.org> wrote:
> >>
> >> From: Fenglin Wu <quic_fenglinw@quicinc.com>
> >>
> >> Add support for a new SPMI vibrator module which is very similar
> >> to the vibrator module inside PM8916 but has a finer drive voltage
> >> step and different output voltage range, its drive level control
> >> is expanded across 2 registers. The vibrator module can be found
> >> in following Qualcomm PMICs: PMI632, PM7250B, PM7325B, PM7550BA.
> >>
> >> Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
> >> ---
> >>   drivers/input/misc/pm8xxx-vibrator.c | 51 +++++++++++++++++++++++++++++-------
> >>   1 file changed, 42 insertions(+), 9 deletions(-)
> >>
> >> diff --git a/drivers/input/misc/pm8xxx-vibrator.c b/drivers/input/misc/pm8xxx-vibrator.c
> >> index 2959edca8eb9..35bb6f450fd2 100644
> >> --- a/drivers/input/misc/pm8xxx-vibrator.c
> >> +++ b/drivers/input/misc/pm8xxx-vibrator.c
> >> @@ -12,10 +12,10 @@
> >>   #include <linux/regmap.h>
> >>   #include <linux/slab.h>
> >>
> >> -#define VIB_MAX_LEVEL_mV       (3100)
> >> -#define VIB_MIN_LEVEL_mV       (1200)
> >> -#define VIB_PER_STEP_mV        (100)
> >> -#define VIB_MAX_LEVELS         (VIB_MAX_LEVEL_mV - VIB_MIN_LEVEL_mV + VIB_PER_STEP_mV)
> >> +#define VIB_MAX_LEVEL_mV(vib)  (vib->drv2_addr ? 3544 : 3100)
> >> +#define VIB_MIN_LEVEL_mV(vib)  (vib->drv2_addr ? 1504 : 1200)
> >> +#define VIB_PER_STEP_mV(vib)   (vib->drv2_addr ? 8 : 100)
> >> +#define VIB_MAX_LEVELS(vib)    (VIB_MAX_LEVEL_mV(vib) - VIB_MIN_LEVEL_mV(vib) + VIB_PER_STEP_mV(vib))
> >>
> >>   #define MAX_FF_SPEED           0xff
> >>
> >> @@ -26,6 +26,9 @@ struct pm8xxx_regs {
> >>          unsigned int drv_offset;
> >>          unsigned int drv_mask;
> >>          unsigned int drv_shift;
> >> +       unsigned int drv2_offset;
> >> +       unsigned int drv2_mask;
> >> +       unsigned int drv2_shift;
> >>          unsigned int drv_en_manual_mask;
> >>   };
> >>
> >> @@ -45,6 +48,18 @@ static struct pm8xxx_regs pm8916_regs = {
> >>          .drv_en_manual_mask = 0,
> >>   };
> >>
> >> +static struct pm8xxx_regs pmi632_regs = {
> >> +       .enable_offset = 0x46,
> >> +       .enable_mask = BIT(7),
> >> +       .drv_offset = 0x40,
> >> +       .drv_mask = GENMASK(7, 0),
> >> +       .drv_shift = 0,
> >> +       .drv2_offset = 0x41,
> >> +       .drv2_mask = GENMASK(3, 0),
> >> +       .drv2_shift = 8,
> >> +       .drv_en_manual_mask = 0,
> >> +};
> >> +
> >>   /**
> >>    * struct pm8xxx_vib - structure to hold vibrator data
> >>    * @vib_input_dev: input device supporting force feedback
> >> @@ -53,6 +68,7 @@ static struct pm8xxx_regs pm8916_regs = {
> >>    * @regs: registers' info
> >>    * @enable_addr: vibrator enable register
> >>    * @drv_addr: vibrator drive strength register
> >> + * @drv2_addr: vibrator drive strength upper byte register
> >>    * @speed: speed of vibration set from userland
> >>    * @active: state of vibrator
> >>    * @level: level of vibration to set in the chip
> >> @@ -65,6 +81,7 @@ struct pm8xxx_vib {
> >>          const struct pm8xxx_regs *regs;
> >>          unsigned int enable_addr;
> >>          unsigned int drv_addr;
> >> +       unsigned int drv2_addr;
> >>          int speed;
> >>          int level;
> >>          bool active;
> >> @@ -82,6 +99,10 @@ static int pm8xxx_vib_set(struct pm8xxx_vib *vib, bool on)
> >>          unsigned int val = vib->reg_vib_drv;
> >>          const struct pm8xxx_regs *regs = vib->regs;
> >>
> >> +       /* vibrator without drv2_addr needs be programmed in step increments */
> >
> > How are these two items related? Are you using vib->drv2_addr as a
> > marker for 'particular generation'? In such a case please use a flag
> > instead.
> >
> > The rest looks good to me.
> >
> Are you suggesting to add a flag in pm8xxx_vib as a discriminator for
> the new generation? I actually tried to avoid that because of this comment:
> https://lore.kernel.org/linux-arm-msm/ZgXSBiQcBEbwF060@google.com/#t

Add a flag for level being programmed in steps or in mV. Using
drv2_addr instead of such flag is a hack.

>
> >> +       if (!vib->drv2_addr)
> >> +               vib->level /= VIB_PER_STEP_mV(vib);
> >> +
> >>          if (on)
> >>                  val |= (vib->level << regs->drv_shift) & regs->drv_mask;
> >>          else
> >> @@ -93,6 +114,17 @@ static int pm8xxx_vib_set(struct pm8xxx_vib *vib, bool on)
> >>
> >>          vib->reg_vib_drv = val;
> >>
> >> +       if (regs->drv2_mask) {
> >> +               if (on)
> >> +                       val = (vib->level << regs->drv2_shift) & regs->drv2_mask;
> >> +               else
> >> +                       val = 0;
> >> +
> >> +               rc = regmap_write_bits(vib->regmap, vib->drv2_addr, regs->drv2_mask, val);
> >> +               if (rc < 0)
> >> +                       return rc;
> >> +       }
> >> +
> >>          if (regs->enable_mask)
> >>                  rc = regmap_update_bits(vib->regmap, vib->enable_addr,
> >>                                          regs->enable_mask, on ? regs->enable_mask : 0);
> >> @@ -115,17 +147,16 @@ static void pm8xxx_work_handler(struct work_struct *work)
> >>                  return;
> >>
> >>          /*
> >> -        * pmic vibrator supports voltage ranges from 1.2 to 3.1V, so
> >> +        * pmic vibrator supports voltage ranges from MIN_LEVEL to MAX_LEVEL, so
> >>           * scale the level to fit into these ranges.
> >>           */
> >>          if (vib->speed) {
> >>                  vib->active = true;
> >> -               vib->level = ((VIB_MAX_LEVELS * vib->speed) / MAX_FF_SPEED) +
> >> -                                               VIB_MIN_LEVEL_mV;
> >> -               vib->level /= VIB_PER_STEP_mV;
> >> +               vib->level = VIB_MIN_LEVEL_mV(vib);
> >> +               vib->level += mult_frac(VIB_MAX_LEVELS(vib), vib->speed, MAX_FF_SPEED);
> >>          } else {
> >>                  vib->active = false;
> >> -               vib->level = VIB_MIN_LEVEL_mV / VIB_PER_STEP_mV;
> >> +               vib->level = VIB_MIN_LEVEL_mV(vib);
> >>          }
> >>
> >>          pm8xxx_vib_set(vib, vib->active);
> >> @@ -203,6 +234,7 @@ static int pm8xxx_vib_probe(struct platform_device *pdev)
> >>
> >>          vib->enable_addr = reg_base + regs->enable_offset;
> >>          vib->drv_addr = reg_base + regs->drv_offset;
> >> +       vib->drv2_addr = reg_base + regs->drv2_offset;
> >>
> >>          /* operate in manual mode */
> >>          error = regmap_read(vib->regmap, vib->drv_addr, &val);
> >> @@ -257,6 +289,7 @@ static const struct of_device_id pm8xxx_vib_id_table[] = {
> >>          { .compatible = "qcom,pm8058-vib", .data = &pm8058_regs },
> >>          { .compatible = "qcom,pm8921-vib", .data = &pm8058_regs },
> >>          { .compatible = "qcom,pm8916-vib", .data = &pm8916_regs },
> >> +       { .compatible = "qcom,pmi632-vib", .data = &pmi632_regs },
> >>          { }
> >>   };
> >>   MODULE_DEVICE_TABLE(of, pm8xxx_vib_id_table);
> >>
> >> --
> >> 2.25.1
> >>
> >>
> >
> >



-- 
With best wishes
Dmitry

