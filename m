Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AABF54F0FD9
	for <lists+linux-input@lfdr.de>; Mon,  4 Apr 2022 09:11:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355612AbiDDHMm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 4 Apr 2022 03:12:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352972AbiDDHMk (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 4 Apr 2022 03:12:40 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3201381BA
        for <linux-input@vger.kernel.org>; Mon,  4 Apr 2022 00:10:44 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id c42so2444617edf.3
        for <linux-input@vger.kernel.org>; Mon, 04 Apr 2022 00:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=logitech.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=H2CZdT84VHrboBWhhSsCcDw/5boHuP9rACBsldjOPCk=;
        b=Oj3/9bjQea1oKTHwHHBJzAoELsbG4oZbG6e0l/ZCjnV5WKvGOzoEnJNdXHI75w0tdq
         kd7oMBwWPM8HRn6z2pIBmDr/PMEroLLhNnFZMDcJq3tkrf25YO2ivfL5NVrUnt1XuR/j
         T3xBB5KIgXnMJybg71uzwf7NYmzGM8J9DLOi1Fh4baWPuwN60F1QccKk3ighyRgBKjBY
         Z+ZVWv6AR+vXBrhJXUiVAICOqmQepvvjyIpEYWespBPeAuWkTyToU2EhJ+2+iCmmAcuy
         cofxuIg/gR2c6aWxuHAq5QP7YGE+eIx0iuC78REUMKUcu0K+qHK9X3olgjP269XPoK1u
         OOnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=H2CZdT84VHrboBWhhSsCcDw/5boHuP9rACBsldjOPCk=;
        b=JeSO+tnM/OSuHib9Ft2XUFoi/Jc91Bt+36yd4ufMKVVTr29MZPKUq8LHOGAqTq1C44
         XlT1ccvPWwjTVrgl1agrCEMSqC2CslLhd5uXM++1zba1gbDY6ZVMp8X1un/qJboGZ2f9
         jflMLMOO4jB7V2mt6oA6IX3GwgCoNWi4CeGtwb1j8CiycPKCSud6wuSMEwX80G7NR4z5
         xjbRdsP23YHI6RR1J3vew+vA/aR51rUkXdlW7Gi8Of6/T3/iWK/MtbmocO1OPSZpTRg1
         K74bvKEAd5KKOzw0unZjFrexlT+DJ7Wpf1NcZr7+EIjHpC2Ll582KCnJnK6ai5tG8g4B
         y+4A==
X-Gm-Message-State: AOAM531OCQ80qa/oG5IDZCo21f4y/LTkDdhUWRO/o+lwwDGA3HSRCZJo
        dsgQgvt5DLAErD1g32LlDUhtUVUIt5fftaQ9f2Lo6g==
X-Google-Smtp-Source: ABdhPJyWbKHbrCwtgtfUKg6kNdvEJY7r5sw1BOwCCwiZxfe1ZLlS6fSpqUVtLKsfIhs/IzK/Kb97D1lSixnv0psKytU=
X-Received: by 2002:a05:6402:749:b0:419:2707:7495 with SMTP id
 p9-20020a056402074900b0041927077495mr31788466edy.317.1649056243257; Mon, 04
 Apr 2022 00:10:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAO3Us=nJbw6haHuCg6ZTwamggRFfKuTncg2r9XwDxjv0-ocZtw@mail.gmail.com>
 <a2ccd37e20b210a1a35188c949d5658314a22c86.camel@archlinux.org>
In-Reply-To: <a2ccd37e20b210a1a35188c949d5658314a22c86.camel@archlinux.org>
From:   Nestor Lopez Casado <nlopezcasad@logitech.com>
Date:   Mon, 4 Apr 2022 09:10:17 +0200
Message-ID: <CAE7qMrrOU4-qZZh_YoDXS__Xhh2cCJsnnJ-G245_ENrEEp0e3g@mail.gmail.com>
Subject: Re: Battery indication for Logitech devices
To:     =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@archlinux.org>
Cc:     Marcos Alano <marcoshalano@gmail.com>,
        HID CORE LAYER <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

I've got this from asking internally:

" The information should be accurate in both BAS and HIDPP interfaces.
However, today the BAS interface is limited. Version  2.0 will be
better but not yet released. As you have access to the HIDPP, I
recommend using only this one. Like this, the type of connection can
be ignored (BLE or USB dongle) "

-nestor


On Fri, Apr 1, 2022 at 6:08 PM Filipe La=C3=ADns <lains@archlinux.org> wrot=
e:
>
> On Fri, 2022-04-01 at 06:44 -0300, Marcos Alano wrote:
> > Hello fellow developers!
> >
> > We are having a discussion about a question and I think we can get
> > help here. The discussion is
> > https://gitlab.freedesktop.org/upower/upower/-/issues/166#note_1322354
> > The problem is when we use a Logitech device, we get two discrepant
> > information about battery level, one from Bluetooth stack and another
> > one from HID++ module.
> > The question here is: what is the most precise information, so we can
> > deduplicate but keep the indicator precise?
> >
> > Thank you.
> >
>
> Hi Marcos,
>
> I think the battery reported by the HID++ driver should be more accurate =
in
> certain devices.
>
> CCing Nestor as he may be able to clarify this further.
>
> Cheers,
> Filipe La=C3=ADns
