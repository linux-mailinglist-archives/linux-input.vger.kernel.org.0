Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 983FB4C7B37
	for <lists+linux-input@lfdr.de>; Mon, 28 Feb 2022 22:00:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229492AbiB1U6i (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Feb 2022 15:58:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbiB1U6h (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Feb 2022 15:58:37 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76A092E6B8
        for <linux-input@vger.kernel.org>; Mon, 28 Feb 2022 12:57:57 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id y7so14415988oih.5
        for <linux-input@vger.kernel.org>; Mon, 28 Feb 2022 12:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=08heOUSs/evm6vrKQA/nbwdJNtbIXXp+BP9uU16M4h8=;
        b=lZGJ7k4lOyperQpCEy7FodOvfEur8mc0FMpcSw7ub0+CRr5z4EaSObovxJ5cS5qlJV
         yStS1m570w9Ii/xGLVT4Gmze5LB7hghJK3R9tlmLcp6h6zWhSR6VoM2tXCoNq4n+IcVE
         k3+znI9Y0WgY2266ZxLwpgLlVW4lMsAxC2n5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=08heOUSs/evm6vrKQA/nbwdJNtbIXXp+BP9uU16M4h8=;
        b=4on/uIP2IaQ8BoMTNI8aLhpO14qBXdof8ykz19Gve8PhkaFzn3JCX5IkRaQ3qS2849
         8PYBHBBIkwQ24DrD8J/n5H/0jlGBG2Gbv6eb2sU1FkFeevFrYMsbv0a4aPVu3cjn5yJy
         6aPRKc7INsHvj1gl9LfuT7hDHm+BSEZJk+3KTNX44FO07ScwYBQHoR8n+t1k9EYcaczu
         lH5JPuto60oENy8zpQHcvD64bRJ+fCA/Zj8DS2kFISn6YboAH2DgN7MoOxOvnIvdFtlS
         j/ySWKlMVzspUTH3U19RQIyj3TqIobcup0K3cErlvJaCUjVEbbctcO9JvDTujNO1RZjc
         MQFQ==
X-Gm-Message-State: AOAM533qUJpv/8pb9CRfdKMyEm9mM4KqO2EJ2pTn8Id9/r/ncug+DmCS
        q3riwuZaG2It4DR9ohki01oY4+n79USPwaZgXiDUHlnOZaM=
X-Google-Smtp-Source: ABdhPJwIf+CdLyI6gbsIzswGMBkKSBGj/5kNbO32FA09cFeTSpl3a2I7myfzlMikD6VK9UUBweuOzrI3296cyTjKalc=
X-Received: by 2002:a05:6808:20a7:b0:2d4:d2f1:9edc with SMTP id
 s39-20020a05680820a700b002d4d2f19edcmr10401751oiw.64.1646081876847; Mon, 28
 Feb 2022 12:57:56 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Feb 2022 12:57:56 -0800
MIME-Version: 1.0
In-Reply-To: <20220228075446.466016-6-dmitry.torokhov@gmail.com>
References: <20220228075446.466016-1-dmitry.torokhov@gmail.com> <20220228075446.466016-6-dmitry.torokhov@gmail.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 28 Feb 2022 12:57:56 -0800
Message-ID: <CAE-0n50nS_y740FWAJZF5q_NtawoFeDqE1C-ENLKBaCYmMfiJA@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] HID: google: modify HID device groups of eel
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>,
        benjamin.tissoires@redhat.com, Jiri Kosina <jikos@kernel.org>,
        "Sean O'Brien" <seobrien@chromium.org>,
        "Douglas Anderson linux-kernel @ vger . kernel . org" 
        <dianders@chromium.org>, Jiri Kosina <jkosina@suse.cz>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Quoting Dmitry Torokhov (2022-02-27 23:54:46)
> From: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
>
> If HID_GROUP of eel is set to HID_GROUP_GENERIC, Whiskers Tablet Mode
> Switch of eel hammer will not be detected by system because the
> hid-vivaldi driver probes the device. When it is set to
> HID_GROUP_VIVALDI, system will detect Whiskers Tablet Mode Switch
> successfully and also support the vivaldi keyboard layout.
>
> Tested-by: "Sean O'Brien" <seobrien@chromium.org>
> Acked-by: Jiri Kosina <jkosina@suse.cz>
> Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
> [swboyd@chromium.org: Expand on commit text]
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> Link: https://lore.kernel.org/r/20220216195901.1326924-5-swboyd@chromium.org
> Patchwork-Id: 12748989

Should this patchwork id be removed?
