Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EA7A7B992B
	for <lists+linux-input@lfdr.de>; Thu,  5 Oct 2023 02:13:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244194AbjJEANm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Oct 2023 20:13:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244152AbjJEANm (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 4 Oct 2023 20:13:42 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 507A0DC
        for <linux-input@vger.kernel.org>; Wed,  4 Oct 2023 17:13:38 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-50302e8fca8so2489e87.0
        for <linux-input@vger.kernel.org>; Wed, 04 Oct 2023 17:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696464816; x=1697069616; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vRF+vIlJA3ZehEMRKa/evOkO3sf/u/GsKZC4fdcnalA=;
        b=ZmI/mrHVP85i4YI8gJizJqD2zA296qfmmnX5RqwO71rE6I1rGR+W+NZE7tn2WFxCQq
         /G/NkgTQ7VDt+msZOSEdZZ2ykmWzlFA3/9yv/mK41ixVRjx4C1QGxgSC01hAriA22XM8
         AdW2t8wyUDy4IdAoNcO1EPxWC/0KaBj+nj2DwOHDtpFwz9nj7UFQLHz736Tf/IPtqKTy
         Dc6TbqElB3FY9ZNpNd4UaqC4nS/TdEpcOLQezLUxuoD3NhOjjG9VsPO4SHcaoDiXuvSJ
         p+f2MEupoqQ5HbwGoD48kquCu4ZfkA5Ljn6cOl1N6EuSNYcQe/dDusrrN8+WNz25QlVy
         fIfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696464816; x=1697069616;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vRF+vIlJA3ZehEMRKa/evOkO3sf/u/GsKZC4fdcnalA=;
        b=iPXq/SLYtXNxZuqV1irK1uI39JrWm6VkNatRniZ9JjIc02j8t2bMG4hJm9kJ7Ttz0k
         psSZJGavp1sX3OsAf+56v3+pzLvOWo1whOdM+0rFDcF/RYmU6o5Yza/VNEmCE4IpjhjP
         rwtKQhe0OWZ0J75pKL5jbw1UTX49cGWovPZ1Sn70LDLdAMMwGADZbdBL+lS8xhPhr2H/
         YUTO4Y0/oW0RIPofB7M26g1TNlEDDjyjLoeMIxCJPlkWX82R4lkv5yNcaOMBCxSgBe6l
         x7vgu8QGR/ce4hs1GRUNMoXbe07HU/XKaTQWAv0bO6Uo5vIqSdRSsn5a7t8WsjZ/muW+
         1OMw==
X-Gm-Message-State: AOJu0Yz0thNAxnxDiIFiP5ZQWegY1P5v0IJwDWyibLszScuKn7gbnDeo
        7V5k4LvQ6EW0aoTTAGuBbjr7fk/MV9zGrCS4cku5Qgcx9QZPqsUaaCfRyq9B
X-Google-Smtp-Source: AGHT+IG24SY+AmaIc+GhrEz329Y4vBmKjCMcDq+rUUT0zgxupE8c2rrSkXUVRsTg1cVaRBl7z6gixwGZa6VYIoacwHE=
X-Received: by 2002:ac2:5d67:0:b0:502:932e:2e36 with SMTP id
 h7-20020ac25d67000000b00502932e2e36mr31850lft.2.1696464816245; Wed, 04 Oct
 2023 17:13:36 -0700 (PDT)
MIME-Version: 1.0
References: <20231004005729.3943515-1-jefferymiller@google.com> <ZR1yUFJ8a9Zt606N@penguin>
In-Reply-To: <ZR1yUFJ8a9Zt606N@penguin>
From:   Jeffery Miller <jefferymiller@google.com>
Date:   Wed, 4 Oct 2023 19:13:24 -0500
Message-ID: <CAAzPG9Pp6mHfEziJiUuhDRmkKMfiiPD6axtfAMaCJcEAcuQPiA@mail.gmail.com>
Subject: Re: [PATCH] Input: elantech - fix fast_reconnect callback in ps2 mode
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     regressions@lists.linux.dev, benjamin.tissoires@redhat.com,
        linux@leemhuis.info, Andrew Duggan <aduggan@synaptics.com>,
        Andrew Duggan <andrew@duggan.us>, loic.poulain@linaro.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Dmitry,

On Wed, Oct 4, 2023 at 9:11=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> In fact, now that I think about it more, we should rework the original
> patch that added the delay, so that we do not wait these 30 msec in the
> "fast" reconnect handler. It turns out your original approach was
> better, but we should not be using retries, but rather the existing
> reset_delay_ms already defined in rmi platform data. I would appreciate
> if you try the draft patch at the end of this email (to be applied after
> reverting your original one adding the delay in psmouse-smbus.c).

I tested the draft patch and it works. I did revert the previous delay
patch while testing it.

>
> I think we need a similar change in synaptics.c as that one also can
> fall back to PS/2 mode.
>
Ah, good point, yes it does appear this needs to be done as well.
I have tested and will post an new version of the patch to include
the fix in synaptics.c as well.

Thanks,
Jeff
