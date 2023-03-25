Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BA9E6C8EF4
	for <lists+linux-input@lfdr.de>; Sat, 25 Mar 2023 16:16:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbjCYPQi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 25 Mar 2023 11:16:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjCYPQh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 25 Mar 2023 11:16:37 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 703558A7F;
        Sat, 25 Mar 2023 08:16:36 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id m20-20020a9d6094000000b0069caf591747so2416974otj.2;
        Sat, 25 Mar 2023 08:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679757395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/TlZfpBWvem+gaoqytw86JtAMfZO3m4fbJOdKfQtUeY=;
        b=XXRskjzDr6Hq1YNXds3If48Z8+ylixa9vTOaxcZD5cv2GrX02FrO6kI8aPemoDJYyC
         7YQStXunbzjG75rZ4LW8Z8dv68u14RliwVGxWNDiIYWTL++ZtNUopyap0IwTC2NhiY8l
         I7+7Y/IUVh0krBWiVTdDlpBf3B/HK4QwbceTrbmpWFY6edJs/NQLGVV0beYJFhMo+hoO
         hT+ntC7/kU5QJRGfj3TSY7JMa3btq+MAaDKhUB8kY9C4i9AyoNnDL7+ZbEikGsEqhfGi
         SSc2ISi55bLMiLkZq/mqy9xNAhjqc+HQ8vwAg/rLVWLsr8XQFKzzOCZ8p3dv5QaW5nFx
         Qu8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679757395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/TlZfpBWvem+gaoqytw86JtAMfZO3m4fbJOdKfQtUeY=;
        b=JrfgTOnAcmkBEqqGf52qIs4asncr8woFXufehyxlTmakXU4ZYQpQz1ZEJtpnqBQToE
         uaHc5N7uD3RUZ3nwcmFbMPMBr1X8zxigmRfsRGNWoO7ESlAkPHKFGJUuFTLfOk7ckT4B
         vc2spQulQLrSwlFj/HVcRDFygxrpl593j8IVEbT0aoHBEnRnxGvZ4OjwpF0YWXInHehK
         9eSFjyNKH7tdB/sHa2xi4EF8Pb5QpAnpc5uXoHfbpYLBsHBaynjsqNC3oezwtOkMQ50z
         neHdr+/KL7Sf24htH6tbDeiY1pGUbB2mnicH5i9IynMj8vBqth2n8J069lAQUymnJqCt
         Lpsw==
X-Gm-Message-State: AO0yUKWGwmwtsZ2FyV47IjC+IC0wzJ9/kIkUKhJdp/C3M5RJlQIgQTBH
        dxW7xjZZzsxtq5zYRYXMq0idXixSKsujpkmCbsaaXyKNKj9y3w==
X-Google-Smtp-Source: AK7set/fOY9zW7NY7ed1UwkV6SsJlN7pg97FxNKrefbymDRsv+K4dZgq127PjJX0/Ob7qA03oX+H6jnAD2qJlVgkAgU=
X-Received: by 2002:a9d:6502:0:b0:69d:4900:69ef with SMTP id
 i2-20020a9d6502000000b0069d490069efmr2187836otl.0.1679757395437; Sat, 25 Mar
 2023 08:16:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230323025200.5462-1-kallmeyeras@gmail.com> <20230323025200.5462-3-kallmeyeras@gmail.com>
 <7584e398-202a-dcee-ef5d-47a3989b06ab@gmx.de>
In-Reply-To: <7584e398-202a-dcee-ef5d-47a3989b06ab@gmx.de>
From:   Andrew Kallmeyer <kallmeyeras@gmail.com>
Date:   Sat, 25 Mar 2023 08:16:24 -0700
Message-ID: <CAG4kvq9apmScR2Y8VO4Xb=4QPVw3XE19m2fR+L_xgER2ka+BvQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] platform/x86: Add driver for Yoga Tablet Mode switch
To:     Armin Wolf <W_Armin@gmx.de>
Cc:     platform-driver-x86@vger.kernel.org, Gergo Koteles <soyer@irl.hu>,
        Ike Panhc <ike.pan@canonical.com>, linux-input@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Mar 25, 2023 at 12:10=E2=80=AFAM Armin Wolf <W_Armin@gmx.de> wrote:
>
> Hi,
>
> is it really necessary to allow userspace to read/write ec_trigger? The A=
CPI device
> used for triggering the EC is only initialized during probing, so changin=
g the value
> of ec_trigger will make no difference in such cases.
>
> Maybe you could change module_param(ec_trigger, bool, 0644) to module_par=
am(ec_trigger, bool, 0)?
>
> Armin Wolf

Great point, this is actually a regression from Gergo's original patch
that I didn't realize I caused. I believe the intention was that if
the quirk detection code doesn't have full coverage users can set the
parameter themselves. In Gergo's code it used the acpi_device from
ideapad-laptop.c which is always loaded if it exists. Now I only load
it if ec_trigger is true at probe time, I think I should update it to
load the acpi device always if it exists so that the user can set this
parameter at any time. I suppose I would just remove the if
(ec_trigger) (and the debug print) in the probe code when I load it.

That is, unless you think it is best to just patch in more models to
the quirk detection later and not provide a parameter. Barnab=C3=A1s
actually suggested removing the ec_trigger flag completely because
right now the code isn't relying on it, but I think that is a bug.
