Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DD9249BC75
	for <lists+linux-input@lfdr.de>; Tue, 25 Jan 2022 20:48:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231156AbiAYTsa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 25 Jan 2022 14:48:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230383AbiAYTsX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 25 Jan 2022 14:48:23 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62899C06173B
        for <linux-input@vger.kernel.org>; Tue, 25 Jan 2022 11:48:23 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id s9so6030045wrb.6
        for <linux-input@vger.kernel.org>; Tue, 25 Jan 2022 11:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:from
         :subject:content-transfer-encoding;
        bh=5vOe3NpBEeO71S2K6+C8svjFMB38x1m67PiWkkSJlUo=;
        b=lycbURW14UtXDuNpV7zrZtMKUGt3iMGBfzWZGxApYSzqD9RIRv1ZCIR5hjnPqlU1Wj
         Zfb6R9h/VcZVwFL3HJkXQeo8tQpjxHXqYEzqqoyFsha42mIaIOj+EXAqfPsjIHWUKSZ6
         biwG6pnwLWOrHUQMdM4t+iwymK3tPh7qV4ExSxdSnhOaUWv6FzP9wcGxoT8/gb19mhFA
         L9NPpPTqX13DqYi1FcS7dYpKBSYORKJTSlfkQMQsRi8xiCgC4qZlxFJV5z8APIgPxUkP
         olb3q1ifFzT2lj2zCaDrrnsrnoX4AFP8p/m8YtUzezh4h7TmGWgxTLcSBhoPJD68uUg/
         Yivw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:from:subject:content-transfer-encoding;
        bh=5vOe3NpBEeO71S2K6+C8svjFMB38x1m67PiWkkSJlUo=;
        b=uJAJXfSbllNOiwcPQs/e7WlzcxtDYsQMtTCmazKvX6pxdOmBozzbhrwW9LFTzuIjE4
         Lo0H0k6GY9F6+/buIWFV1owRyYi/CReHFzXL668HQRmGMteuGsS0LmLl+zrZQh55V/qx
         XCIiZP3mTofnrPtKi2R/KocUdONa9v8FeW8Op2gcefT4G0UvALPU5wLjqWOepqtSfJhj
         NaeD7AY9YISfDQJt45mKcvnwIlNWMJgpSePPOEAw+FzJOFzpu2F1cbO66A7c3D/HuBsq
         Wgulenm0UmdItbPV5t3xEUtNFwPB1Cnt7LFHpMCcLajseBhiI58UTnbpkH8bY8QprxVc
         NSwg==
X-Gm-Message-State: AOAM531aKxqJ2CNsT94YnhDYoselBiGaEja6RfsPmhYstDBq5ec1cYUP
        e6NllLs7Tuw1jo68p+bQaGw1riiGMZPOm9VQ
X-Google-Smtp-Source: ABdhPJxc9C7uV2OM8BoeGBZo4VjZcMzkBXVCuyH3+qWuNd1VY20NnVKj3pqTEouTcWxOLOMBfBuJMw==
X-Received: by 2002:a05:6000:188f:: with SMTP id a15mr2992979wri.16.1643140101996;
        Tue, 25 Jan 2022 11:48:21 -0800 (PST)
Received: from ?IPV6:2a02:908:e942:13c0:a8d3:84aa:bb00:379d? ([2a02:908:e942:13c0:a8d3:84aa:bb00:379d])
        by smtp.gmail.com with ESMTPSA id j19sm1476487wmq.17.2022.01.25.11.48.21
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jan 2022 11:48:21 -0800 (PST)
Message-ID: <cb3d941d-88c7-1ca0-27db-92d32883f355@gmail.com>
Date:   Tue, 25 Jan 2022 20:48:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: de-DE
To:     linux-input@vger.kernel.org
From:   Sebastian Arnhold <sebastian.arnhold387@gmail.com>
Subject: Stylus battery reported as having 1% charge even though fully charged
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Dear developers,

when using GNOME 41.1 on Wayland, it reports my stylus battery to be 
stuck at 1% all the time, independent of its actual charging status. 
This is also independent from the stylus I use, as I've tried with two 
different ones.

The device registers as ELAN9008:00 04F3:2DD4 in GNOME settings.

The GNOME developers helped me track the bug down to upower, as upower 
itself shows the charging status to be stuck at 1%. The upower 
developers then closed my bugreport and relayed me here, since they 
believe it's a bug in the kernel itself.

Can you help me fix this?

Thanks in advance,
Sebastian
