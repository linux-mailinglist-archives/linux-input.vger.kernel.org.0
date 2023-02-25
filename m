Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4D3F6A2B4C
	for <lists+linux-input@lfdr.de>; Sat, 25 Feb 2023 19:27:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229578AbjBYS1K (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 25 Feb 2023 13:27:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229569AbjBYS1J (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 25 Feb 2023 13:27:09 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D698E11EA3
        for <linux-input@vger.kernel.org>; Sat, 25 Feb 2023 10:27:08 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id i5so1061933pla.2
        for <linux-input@vger.kernel.org>; Sat, 25 Feb 2023 10:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rXeDHFZcVOvss1BIW+kL49MYBMlusP7/QJhQluj9uPA=;
        b=MaUGn0BC86XxOm/seu/vcrhnypyHJcQDYUVhdG9OqSu7O7apQjWj+QniwlH3xWR8/y
         TBk/2T7DEwfLTK4Fsb/2Dh8cBnm40Rol1sDK6aiHbR72XaeXdmY1ILMn97EQDHrYFW5O
         64a56cUmAffh17aypTZ1xgy5aDQagd9OOFCpIbknzWrt82MFZlA1nl3LSjwhndmPyC4Q
         RLBJ26p23y4hAL6RqGTRk4MEXPk9qvp8slxBQieoeyFSnEo8IfEVCye4NHfMrJ8t5YjZ
         Aob10F3ggDxkQgyJsDECRRuo6inK2sEVhXzTg1rv/4DYmBCeCM7wE7GhXsguANmyqiam
         Qivg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rXeDHFZcVOvss1BIW+kL49MYBMlusP7/QJhQluj9uPA=;
        b=kQ7sKLTpIPs6yin/S9/jVWbZZQtjrY6YrAuGYWRTmqDh9dBhLl8+EYxWH2ohFhjjU6
         WzmPN6dmN4VLj/kRzl5NM0EpcrUlt02rcU+BxslU16ru0UzW6VBR36gQ5MYZ0c+B3CtQ
         efVPuXb3HkDYzOvUerNuxu4n0C01FNK+6zD8DHfxgHL4G+RPXczXyNMEYxR8KdeK1yln
         U9B20rys4KqJFG2E2kXyF2b44Pw527nSrzzbmctHqLo3sWsqzQIXHvatOGpjkQDZP7cb
         uzW9QPYE1XL1ZTxaHkYcTf/a3Oemlv/2tydPGJGchIhcdmCC30iLqsNy3qUwTuiAkw6F
         qX0Q==
X-Gm-Message-State: AO0yUKUN+bSJl8v9dN63dIuHtCbzpyybJvk8k0QD3CXT1n8JJCU7wDd9
        1QNI0VJ4xIs27jLMSv5P/qg=
X-Google-Smtp-Source: AK7set/N6f4qFh1NOQBZmIxGH0XSxGCVYIDFRLpn6hIPDZy1hRrsPboL/DAWZfof8YFlORQoMlhFdg==
X-Received: by 2002:a05:6a21:340a:b0:cc:d386:ec28 with SMTP id yn10-20020a056a21340a00b000ccd386ec28mr1460383pzb.12.1677349628233;
        Sat, 25 Feb 2023 10:27:08 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:2c72:3c03:87ac:5b3e])
        by smtp.gmail.com with ESMTPSA id g11-20020aa7818b000000b005ae02dc5b94sm1477243pfi.219.2023.02.25.10.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Feb 2023 10:27:07 -0800 (PST)
Date:   Sat, 25 Feb 2023 10:27:04 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lyude Paul <lyude@redhat.com>
Cc:     Vicki Pfau <vi@endrift.com>,
        Michael Cullen <michael@michaelcullen.name>,
        Marcos Alano <marcoshalano@gmail.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: xpad - fix PowerA EnWired Controller guide button
Message-ID: <Y/pS+NAqCwdQNJNQ@google.com>
References: <20221006221209.2016372-1-vi@endrift.com>
 <d4b320fcca34c25713836c1ef5a34157c67071f0.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d4b320fcca34c25713836c1ef5a34157c67071f0.camel@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Lyude,

On Sat, Feb 25, 2023 at 02:14:27AM +0100, Lyude Paul wrote:
> Poke, Dmitry - any chance we could get this pushed?

I was waiting for Vicki to respond to Mattijs' comments...

Thanks.

-- 
Dmitry
