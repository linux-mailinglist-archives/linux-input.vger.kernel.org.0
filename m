Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73EF57AC4A1
	for <lists+linux-input@lfdr.de>; Sat, 23 Sep 2023 21:07:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbjIWTIA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 23 Sep 2023 15:08:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjIWTH7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 23 Sep 2023 15:07:59 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D556193
        for <linux-input@vger.kernel.org>; Sat, 23 Sep 2023 12:07:52 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-59bc956b029so47803687b3.2
        for <linux-input@vger.kernel.org>; Sat, 23 Sep 2023 12:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695496071; x=1696100871; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bCvRyara8UxZnmS7QLtvy0QGs8MlshLAxN9jzkT187s=;
        b=evHeq0IBQ7a8FeZCC9oS0EsrYFF2N3XAfZ4r09cswmHG328x+xSCrtfDdGe3/3j1pO
         /Zz3P0H6jHN51Px4rOSxpKzOHszwPEpCFX5pwEaG46BvDcGi8kdqnBFkPY4fjMWM9nVO
         Pir7MDblp3w/LmlskslauEiJoLfavZhnxnYV9+bFes7kYugoCZIEQ1faUkM2yZcwrUfr
         JTppJUnJklcmLBfeIH/00h6MpyE9NQeqHD59lbPZu0DMXrqsgFxeAj6fwUkBqxN8Zfp+
         C1rtzgKlx5A5iI44mAuSxti9D/e1AShOTV4bx0+zN5msqjYgMlBGQabCawjBIdSPe6X3
         zoTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695496071; x=1696100871;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bCvRyara8UxZnmS7QLtvy0QGs8MlshLAxN9jzkT187s=;
        b=e+koG6ntk4Xh4bbr6Wklkt+feTHHh75lxfJaMFR4FKo1139tByQoLSmNCCSNYgTF6S
         MNEj9xUF4a7sNgd4rK1ziUNB7X4f4KIenTFr9a6uvAJzddIkfjjvFg98I4RDoETrsDl9
         VQIwTJrrAkEWm7cSq0GUwBJDH4HH457hhE1ds0q0CU9CiVlN+iJ2CWWKmH84SyzrIeLQ
         ibtxYKJdp/ZVOmJVz4Qlp9q6nAO0MIHkY6ZwJC4Ms5fvyv056juf1/l5ST1t5pCAnqg5
         P1TzEFqqhz1C++e3G2whOs7p/3ObEI8il1y3u4NnQ5lF8YxK563v+7Ip7GsDT9Qnuh/x
         UWkg==
X-Gm-Message-State: AOJu0YxtRGPducJ7EPZp+m94D/c4N80AABuGGG/QLy9Ixg6eh2gVrWk+
        y0jogeYZdY4cP6f7pLhtIZWVcXz6CBq/3BoEIN5Yog==
X-Google-Smtp-Source: AGHT+IFMeO2szRAtNYKa8jIHzG+W6L/P8CwGvwkvrZT2IquamCyVsPNQYwrFiUF4CAXY3X9ucfDBvxdYnwTw6HcIW2Q=
X-Received: by 2002:a0d:dd09:0:b0:59b:524a:7238 with SMTP id
 g9-20020a0ddd09000000b0059b524a7238mr2847276ywe.26.1695496071703; Sat, 23 Sep
 2023 12:07:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230922083801.3056724-1-quic_fenglinw@quicinc.com> <20230922083801.3056724-4-quic_fenglinw@quicinc.com>
In-Reply-To: <20230922083801.3056724-4-quic_fenglinw@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 23 Sep 2023 22:07:40 +0300
Message-ID: <CAA8EJpoW8DJOTVHBu9_+BQs5DtxyJu3xrCfDNyYHn2MeHZHV4w@mail.gmail.com>
Subject: Re: [RESEND PATCH v6 3/3] input: pm8xxx-vibrator: add new SPMI
 vibrator support
To:     Fenglin Wu <quic_fenglinw@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        agross@kernel.org, andersson@kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, quic_collinsd@quicinc.com,
        quic_subbaram@quicinc.com, quic_kamalw@quicinc.com,
        jestar@qti.qualcomm.com, Luca Weiss <luca.weiss@fairphone.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 22 Sept 2023 at 11:38, Fenglin Wu <quic_fenglinw@quicinc.com> wrote:
>
> Add new SPMI vibrator module which is very similar to the SPMI vibrator
> module inside PM8916 but just has a finer drive voltage step (1mV vs
> 100mV) hence its drive level control is expanded to across 2 registers.
> The vibrator module can be found in Qualcomm PMIC PMI632, then following
> PM7250B, PM7325B, PM7550BA PMICs.
>
> Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
> Tested-by: Luca Weiss <luca.weiss@fairphone.com> # sdm632-fairphone-fp3 (pmi632)
> ---
>  drivers/input/misc/pm8xxx-vibrator.c | 55 +++++++++++++++++++++++++---
>  1 file changed, 50 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/input/misc/pm8xxx-vibrator.c b/drivers/input/misc/pm8xxx-vibrator.c
> index d6b468324c77..990e8a9ac018 100644
> --- a/drivers/input/misc/pm8xxx-vibrator.c
> +++ b/drivers/input/misc/pm8xxx-vibrator.c
> @@ -21,6 +21,13 @@
>  #define SPMI_VIB_DRV_LEVEL_MASK                GENMASK(4, 0)
>  #define SPMI_VIB_DRV_SHIFT             0
>
> +#define SPMI_VIB_GEN2_DRV_REG          0x40
> +#define SPMI_VIB_GEN2_DRV_MASK         GENMASK(7, 0)
> +#define SPMI_VIB_GEN2_DRV_SHIFT                0
> +#define SPMI_VIB_GEN2_DRV2_REG         0x41
> +#define SPMI_VIB_GEN2_DRV2_MASK                GENMASK(3, 0)
> +#define SPMI_VIB_GEN2_DRV2_SHIFT       8
> +
>  #define SPMI_VIB_EN_REG                        0x46
>  #define SPMI_VIB_EN_BIT                        BIT(7)
>
> @@ -33,12 +40,14 @@
>  enum vib_hw_type {
>         SSBI_VIB,
>         SPMI_VIB,
> +       SPMI_VIB_GEN2
>  };
>
>  struct pm8xxx_vib_data {
>         enum vib_hw_type        hw_type;
>         unsigned int            enable_addr;
>         unsigned int            drv_addr;
> +       unsigned int            drv2_addr;
>  };
>
>  static const struct pm8xxx_vib_data ssbi_vib_data = {
> @@ -52,6 +61,13 @@ static const struct pm8xxx_vib_data spmi_vib_data = {
>         .drv_addr       = SPMI_VIB_DRV_REG,
>  };
>
> +static const struct pm8xxx_vib_data spmi_vib_gen2_data = {
> +       .hw_type        = SPMI_VIB_GEN2,
> +       .enable_addr    = SPMI_VIB_EN_REG,
> +       .drv_addr       = SPMI_VIB_GEN2_DRV_REG,
> +       .drv2_addr      = SPMI_VIB_GEN2_DRV2_REG,
> +};
> +
>  /**
>   * struct pm8xxx_vib - structure to hold vibrator data
>   * @vib_input_dev: input device supporting force feedback
> @@ -85,12 +101,24 @@ static int pm8xxx_vib_set(struct pm8xxx_vib *vib, bool on)
>  {
>         int rc;
>         unsigned int val = vib->reg_vib_drv;
> -       u32 mask = SPMI_VIB_DRV_LEVEL_MASK;
> -       u32 shift = SPMI_VIB_DRV_SHIFT;
> +       u32 mask, shift;
>
> -       if (vib->data->hw_type == SSBI_VIB) {
> +
> +       switch (vib->data->hw_type) {
> +       case SSBI_VIB:
>                 mask = SSBI_VIB_DRV_LEVEL_MASK;
>                 shift = SSBI_VIB_DRV_SHIFT;
> +               break;
> +       case SPMI_VIB:
> +               mask = SPMI_VIB_DRV_LEVEL_MASK;
> +               shift = SPMI_VIB_DRV_SHIFT;
> +               break;
> +       case SPMI_VIB_GEN2:
> +               mask = SPMI_VIB_GEN2_DRV_MASK;
> +               shift = SPMI_VIB_GEN2_DRV_SHIFT;
> +               break;
> +       default:
> +               return -EINVAL;

Could you please move the switch to the previous patch? Then it would
be more obvious that you are just adding the SPMI_VIB_GEN2 here.

Other than that LGTM.

>         }
>
>         if (on)
> @@ -104,6 +132,19 @@ static int pm8xxx_vib_set(struct pm8xxx_vib *vib, bool on)
>
>         vib->reg_vib_drv = val;
>
> +       if (vib->data->hw_type == SPMI_VIB_GEN2) {
> +               mask = SPMI_VIB_GEN2_DRV2_MASK;
> +               shift = SPMI_VIB_GEN2_DRV2_SHIFT;
> +               if (on)
> +                       val = (vib->level >> shift) & mask;
> +               else
> +                       val = 0;
> +               rc = regmap_update_bits(vib->regmap,
> +                               vib->reg_base + vib->data->drv2_addr, mask, val);
> +               if (rc < 0)
> +                       return rc;
> +       }
> +
>         if (vib->data->hw_type == SSBI_VIB)
>                 return 0;
>
> @@ -128,10 +169,13 @@ static void pm8xxx_work_handler(struct work_struct *work)
>                 vib->active = true;
>                 vib->level = ((VIB_MAX_LEVELS * vib->speed) / MAX_FF_SPEED) +
>                                                 VIB_MIN_LEVEL_mV;
> -               vib->level /= 100;
> +               if (vib->data->hw_type != SPMI_VIB_GEN2)
> +                       vib->level /= 100;
>         } else {
>                 vib->active = false;
> -               vib->level = VIB_MIN_LEVEL_mV / 100;
> +               vib->level = VIB_MIN_LEVEL_mV;
> +               if (vib->data->hw_type != SPMI_VIB_GEN2)
> +                       vib->level /= 100;
>         }
>
>         pm8xxx_vib_set(vib, vib->active);
> @@ -266,6 +310,7 @@ static const struct of_device_id pm8xxx_vib_id_table[] = {
>         { .compatible = "qcom,pm8058-vib", .data = &ssbi_vib_data },
>         { .compatible = "qcom,pm8921-vib", .data = &ssbi_vib_data },
>         { .compatible = "qcom,pm8916-vib", .data = &spmi_vib_data },
> +       { .compatible = "qcom,pmi632-vib", .data = &spmi_vib_gen2_data },
>         { }
>  };
>  MODULE_DEVICE_TABLE(of, pm8xxx_vib_id_table);
> --
> 2.25.1
>


-- 
With best wishes
Dmitry
