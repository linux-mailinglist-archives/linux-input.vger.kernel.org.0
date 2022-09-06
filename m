Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D0935AF3E7
	for <lists+linux-input@lfdr.de>; Tue,  6 Sep 2022 20:47:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229490AbiIFSrz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 6 Sep 2022 14:47:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbiIFSry (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 6 Sep 2022 14:47:54 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F57D86724
        for <linux-input@vger.kernel.org>; Tue,  6 Sep 2022 11:47:54 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id bh13so11429283pgb.4
        for <linux-input@vger.kernel.org>; Tue, 06 Sep 2022 11:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=zjvhT7f0nqm5tVgEXMXSnHlYEQd1wad5Q3eo3rAV33g=;
        b=DwuhRog0wvIBcRCHNf5PpsSd2jXCd9RZX72Ymclbk1SrGU48jjNrP0dyEYx13tXirM
         RGAuJnU55HIjwgs9aBSx3Lydpe5cmidz/Kn/AsjVLwJohssIc/egSTJX0qscPVmeXkQA
         ejgB3LaVAx9hj2+1qNHYIZc0ygT2lZFARfWazCdLrasuLv930Hy0hrQy2kAsoKpWUPXv
         KhPzgElffciLwe1AxVu5cHlIobTK+Oqq5iauXteV4DMCrX9YSiLxAqNP9EdHVu16AFrx
         HDFEceAPgDzDGVe9jVrCR9B2fEmlM2hIy9ww+rQ0Q/5wzUqmlhhRfC4UBxYg54HThBZt
         wFZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=zjvhT7f0nqm5tVgEXMXSnHlYEQd1wad5Q3eo3rAV33g=;
        b=svkTDk1bd68thRQW6I/AtJ50zgwsqKVHHnR6tqE8v7EYCGeWGx58a6MefuAYbwFrdr
         +f8BrPzJtzlN8A4ygoNNz1Ygh3EnxmmmMl6J3H/52RAYscrs/70PbVUZUDTJeAtd39Dn
         5h+OZJrS29Rwoqmh6rhu50+M+kBuk3ea6rYFzWvJTe2UNfMV0J758qIFXzQTDbNyx5gV
         fOQTPuX3xdiKDuodNYQSbNQsNlJfBkx0zsJc7smTninsqVXafhCz0CdpRkNhUXr2ifmp
         xqBkbZ7otVAn1hbUj2Eshdw4v2hbHbLEQIY7x7paxPHzQFi1vyAB6liqKZcc6EzLpN0l
         iN0g==
X-Gm-Message-State: ACgBeo1SFjQ3smXtBDM599sVrRmXidPwYbr0n3AGv93izhren9om/CBx
        jNtYzJl93P/3Ffj+lnvXv1c=
X-Google-Smtp-Source: AA6agR5fOXnCLn+nLqMT8t+rLLKcW4lD0xdGHiiXMELLrybGyViSTdkf1Jgsq1xkTTpYlzgWpxyUSQ==
X-Received: by 2002:a05:6a00:180b:b0:536:816b:f770 with SMTP id y11-20020a056a00180b00b00536816bf770mr57269657pfa.3.1662490073476;
        Tue, 06 Sep 2022 11:47:53 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:1190:fbfa:ae95:111c])
        by smtp.gmail.com with ESMTPSA id k9-20020a170902ce0900b001769e6d4fafsm6258119plg.57.2022.09.06.11.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 11:47:53 -0700 (PDT)
Date:   Tue, 6 Sep 2022 11:47:50 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Pavel Rojtberg <rojtberg@gmail.com>
Cc:     linux-input@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH v2 0/4] Input: xpad - sync with github fork
Message-ID: <YxeV1h7ZT3p4c3Dr@google.com>
References: <20220818154411.510308-1-rojtberg@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220818154411.510308-1-rojtberg@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Aug 18, 2022 at 05:44:07PM +0200, Pavel Rojtberg wrote:
> From: Pavel Rojtberg <rojtberg@gmail.com>
> 
> I maintain the fork of the xpad driver at https://github.com/paroj/xpad.
> This upstreams some changes that have proven to be stable.
> 
> The first patch merely updates the list of supported devices.
> 
> The next two patches improve xbox360w gamepad support.
> I have tested those myself, as I own that device.
> 
> The last patch carries most of the diff and adds support for
> "paddle" buttons found on some Xbox One controllers.
> 
> Compared to v1, this adds the requested tags to the first
> two patches of the series.
> 
> Cameron Gutman (1):
>   Input: xpad - fix wireless 360 controller breaking after suspend
> 
> Christopher Crockett (1):
>   Input: xpad - add support for XBOX One Elite paddles
> 
> Pavel Rojtberg (1):
>   Input: xpad - add supported devices as contributed on github
> 
> Santosh De Massari (1):
>   Input: xpad - Poweroff XBOX360W on mode button long press
> 
>  drivers/input/joystick/xpad.c | 298 +++++++++++++++++++++++++++++++++++++++++++++------------
>  1 file changed, 236 insertions(+), 62 deletions(-)

Applied the lot, thank you.

-- 
Dmitry
