Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDE414B185E
	for <lists+linux-input@lfdr.de>; Thu, 10 Feb 2022 23:40:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345056AbiBJWkt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 10 Feb 2022 17:40:49 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:58928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345054AbiBJWks (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 10 Feb 2022 17:40:48 -0500
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE91326D4
        for <linux-input@vger.kernel.org>; Thu, 10 Feb 2022 14:40:48 -0800 (PST)
Received: by mail-oi1-x235.google.com with SMTP id r27so7649888oiw.4
        for <linux-input@vger.kernel.org>; Thu, 10 Feb 2022 14:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=VRex+gDACPL4ebgCzuLa25Mz65CrUBnkfO3hP0yn1+4=;
        b=jZDB2DkFpMB9TGv9bpe/0/pvZbbAVeu18g8Zasw6oad1z9t0Z494E15DP4wcK9GnjW
         34L1M71Yjw3UApwMB+nTnNXlHXc02DCTEBSQAv637p+6lAymOZByY3UKQdg3ZI0AoGQe
         8v2c4QTGMjtLCt+nldZji2yG9EFr6J8Sk3aHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=VRex+gDACPL4ebgCzuLa25Mz65CrUBnkfO3hP0yn1+4=;
        b=fFJykM/GEzJYwGzeS71On5zRSMRdqe9IoyVm5SOyDKoUSsYpwtS+0E0AaxyeVpe5o1
         qLyh+7YxNgFEDZQ0Ec2QWxxQRqcKHb80COsM3mfDAjjLwUZK4BG3y8CBwIaiuCN9Y1t1
         vu2es80Vii+qlnAIfyJBXWkdd5NRAFV0/PKM/Ycc/XKGaxnqEC/Zjd3q9JJAw0KbX1kr
         V8+viNlJNR+k/uOgc+6xq9qy4ShUwDZ/rmZ7RgzZUl3rxT6ih1R13+Cy9GFA92M/ICVn
         3m1NE6nI03ITFU+7jlbbQKh96QFvZm0uikTWjn0QAdfODc8nS6wW+IaCpWEjVH6Ljwuq
         CUtg==
X-Gm-Message-State: AOAM530nhmxMawbHfwnaUhXs2oq/ouZvG7tCgKxL17xBr5xSHuq0/ODt
        Hh94O0tkBwo+PtHvVnmbJJweNsiqfagdUnfLSTRREA==
X-Google-Smtp-Source: ABdhPJwh+Rcr5IooiCQIQ8w8BQCYJeV9bdPzgybvSewVnppmhSTSRv+3HvgaFBk4Cok75vOEv+QteJVwOb1dYVss5zI=
X-Received: by 2002:a05:6808:190f:: with SMTP id bf15mr2009290oib.40.1644532848158;
 Thu, 10 Feb 2022 14:40:48 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 10 Feb 2022 14:40:47 -0800
MIME-Version: 1.0
In-Reply-To: <20220209225556.3992827-1-swboyd@chromium.org>
References: <20220209225556.3992827-1-swboyd@chromium.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 10 Feb 2022 14:40:47 -0800
Message-ID: <CAE-0n52vS81GYxBCrxb5jf-BOSebU8j2ZzXB17-tspHbNVGKxA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Input/HID: Consolidate ChromeOS Vivaldi keyboard logic
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>, benjamin.tissoires@redhat.com
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        "Sean O'Brien" <seobrien@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Quoting Stephen Boyd (2022-02-09 14:55:51)
> This is a follow-on to this thread[1] where we discussed the need to
> support the vivaldi keyboard function row keys in the google hammer
> driver. I've extracted the common code into a new vivaldi-keymap.c file
> that can be used by the various keyboard drivers used on ChromeOS
> devices to expose the function_row_physmap sysfs attribute. That's a
> good place to keep the HID parsing logic for the vivaldi and hammer
> keyboards too, so one function goes there for that as well. Finally, we
> add support for the function row physmap attribute to the hammer driver.
>
> Changes from v1 (https://lore.kernel.org/r/20220204202021.895426-1-swboyd@chromium.org):
>  * Yet another new file for HID part to fix compilation problems
>
> Cc: Jiri Kosina <jikos@kernel.org>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: "Sean O'Brien" <seobrien@chromium.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
>
> Stephen Boyd (4):
>   Input: atkbd: Convert function_row_physmap to u16 array

I see that this conversion broke stuff. I'll drop this patch and make it
a u32 and resend.

>   Input: Extract ChromeOS vivaldi physmap show function
>   HID: Extract vivaldi hid feature mapping for use in hid-hammer
>   HID: google: Add support for vivaldi to hid-hammer
>
