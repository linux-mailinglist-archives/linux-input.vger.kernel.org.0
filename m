Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80AD023B6AC
	for <lists+linux-input@lfdr.de>; Tue,  4 Aug 2020 10:17:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729820AbgHDIRF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 4 Aug 2020 04:17:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729390AbgHDIRF (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 4 Aug 2020 04:17:05 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7C78C06174A
        for <linux-input@vger.kernel.org>; Tue,  4 Aug 2020 01:17:04 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id r2so31433695wrs.8
        for <linux-input@vger.kernel.org>; Tue, 04 Aug 2020 01:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:to:cc:subject:from:references:in-reply-to:message-id
         :user-agent;
        bh=N/ESX0CuQ5fWN5y/3he15acC6vLdT6nOcBcpchaA3aA=;
        b=IxoKsLG14UlK7K8kS6Saf5AoZ3A5l6ogWBnNFYy/lTARbmMPHos/Bflcv+L7M8Mt9N
         qJOFsSXllIPyDliHUHo6kgqryMugqEuPzdKqGc/th75no/fCvU/4c621f52JDYMwuCsN
         vax2qRbTmdSwfxPBQHTg1e/w9WY/xa2NSAnhwX0z+ajsI70ia5y8k8z2TL9B3u8iOHjn
         d3tdZjMNOya01FSZgj90E1rHzJwBHNGiRXpg7f7OO/djVU3GxDpR/jRwr+Gh/OBjRLy2
         up1Yu89N6yjNqyOZ7X5C7vdmFgVR7OwIJ1OOwaaU+y/gdcUrsvvYDTnas92gdpTPAG13
         1t3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:to:cc:subject:from:references:in-reply-to
         :message-id:user-agent;
        bh=N/ESX0CuQ5fWN5y/3he15acC6vLdT6nOcBcpchaA3aA=;
        b=bxzzYIcOkAkvTEpwzK0QwHjGFAcF786nGqSJbVBuyiuhkXn6mEPH7Zfeli+tFkQauW
         lTqC0pXSsQghX22EO0Ki7iew+QWkR+kv6StKeQpqwTCUO2jPDM84nR3aVRsp4M7wvzyO
         AV9QyLLRh1x1P0E2faZ0IOWjqV+QL7uAU2DmSGgTXgOOVY7XPq7m3CmvnSgrI32+wDXy
         Sp87NrVqgQA8wbuiXIShznZw13s1ZKrpTgzdDs7Mcp043Hy4Sy/dkYayX7Gg6a61AMHE
         I/uHIGfSc1f17F6bfvoehECKANk2mZuVZ9bdUN6R0c6vLL3uGNW1WAg2VTb4ct1Ie0hT
         o6KQ==
X-Gm-Message-State: AOAM533PTKsQwGxV7M3QB/nCaE1C4w35cy0FTaYwAVfYX4iVSQaLiLBK
        qd/wENwzpqpB7pXzCI3duttcvyDOYyQ=
X-Google-Smtp-Source: ABdhPJxlSPws9P2If8yIVQVsSf9e48oI1Gnk8hCxXJU/iqIU4XCSrN2rJoENqYN9WaNjsIK2J51oRw==
X-Received: by 2002:a5d:5589:: with SMTP id i9mr18277087wrv.91.1596529023576;
        Tue, 04 Aug 2020 01:17:03 -0700 (PDT)
Received: from localhost ([2a02:169:1e9::acc])
        by smtp.gmail.com with ESMTPSA id i66sm3699860wma.35.2020.08.04.01.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2020 01:17:02 -0700 (PDT)
Date:   Tue, 04 Aug 2020 10:17:02 +0200
To:     luke@ljones.dev
Cc:     linux-input@vger.kernel.org, jikos@kernel.org,
        benjamin.tissoires@redhat.com
Subject: Re: [PATCH V3]: HID: asus: add support for ASUS N-Key keyboard
From:   "Silvan Jegen" <s.jegen@gmail.com>
References: <K6JIEQ.8WHC60A0TYJ6@ljones.dev>
In-Reply-To: <K6JIEQ.8WHC60A0TYJ6@ljones.dev>
Message-Id: <21DR28I61TGRS.30UBU8HRX5ZB4@homearch.localdomain>
User-Agent: mblaze/0.7-16-g2c35b55 (2020-08-03)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi

Luke Jones <luke@ljones.dev> wrote:
> 
> [snip...] 
> 
> +/*
> + * This enables triggering events in asus-wmi
> + */
> +static int asus_wmi_send_event(struct asus_drvdata *drvdat, u8 code)
> +{
> + int err;
> + u32 retval;
> +
> + err = asus_wmi_evaluate_method(ASUS_WMI_METHODID_DEVS,
> + ASUS_WMI_METHODID_NOTIF, code, &retval);
> + if (err) {
> + pr_warn("Failed to notify asus-wmi: %d\n", err);
> + return err;
> + }

It looks like your MUA removed all indentation tabs from your patch. IIRC,
the gmail web interface has been accused of this before...

Most likely this will have to be fixed before someone approves of
this patch.


Cheers,

Silvan


> [...]
