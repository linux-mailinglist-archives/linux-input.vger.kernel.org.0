Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DE612D8053
	for <lists+linux-input@lfdr.de>; Fri, 11 Dec 2020 22:01:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732785AbgLKVBE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Dec 2020 16:01:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394744AbgLKVAr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Dec 2020 16:00:47 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22D5EC0613CF;
        Fri, 11 Dec 2020 13:00:07 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id t3so7941249pgi.11;
        Fri, 11 Dec 2020 13:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZGxelWSQD2UwrILYZJaY4iMVSWq4vZv8f3wzB8baqe4=;
        b=d0RFiytqcsVBmHQCkBTRiMApimMewmyT3quqpdcq4/L3Zf6tTxG5a0L9EwJh3Ss5nP
         QmRANNKnrEoN1mN/kUJy4zW7ukCOM7vosyy56iqYkwF9S6K2vkXSziXNydmupmM+9sVS
         KN7IaQuRZOgRADutU0/rZ3PEg8Zg6QAV+sf8qlfXxvhbR1FOg61a85oaytVrOeyt3Vt8
         RoFphCgvu/cw9M6lCGjV4yydlIO+oDGf/rX+E1apqlJ6hR8a0FJ/P/SnGQ3zc/85JG1L
         H0LGHtbs3FyyToLkqI4lmTeTKTiOeglIUDzedUaMl+XpRhzPblXFQH7FHOW7gKFEDxJL
         Kt3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZGxelWSQD2UwrILYZJaY4iMVSWq4vZv8f3wzB8baqe4=;
        b=nzGj9grL3rNOSycPNSLLKubEzzKmGf+hM65iLU21FX/4JcUfhIHP7vDYpz+Ervjt4I
         dE3HL4EDEjl3B+XD2KHTBktw4DrrzZ8YVQH+7Yw084IK/smqQgF/PSg1Tmr7OUa2s1g5
         loPiO71BbNzcIzoTvpjPe+Q5F64k90pJWYIIyfmLWMFQb2oEksEaNwaux6U9whbIFpcF
         hYfEfAi8TQvHRbJXZWOwpfgiJNzleSM6VbiOAlMm5gARHknom2ELbqDZcQGT+Yp+LWq+
         HTRCvT75wwHldzRMbCSJU22DPSZza2O3pP4N9c9VGYXPcEExFYh61qA4kvIjBKRScDHE
         OV3w==
X-Gm-Message-State: AOAM530isDrUjkOr39bcAKNgcPsFfCKBzamB1nxZ4ZlBusWWauEQqqmH
        07MvTrUBXNDCzgLaT6ASHBU=
X-Google-Smtp-Source: ABdhPJw6h1Mt5ZUf2NpAqvwo7Zp0kAXoxTbtcNEKM3/47b4aQ2g35OCRtaaVkpYeCnGkJH6L/jJcqg==
X-Received: by 2002:a63:f154:: with SMTP id o20mr13431089pgk.127.1607720406593;
        Fri, 11 Dec 2020 13:00:06 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id u7sm10945041pfh.115.2020.12.11.13.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 13:00:05 -0800 (PST)
Date:   Fri, 11 Dec 2020 13:00:03 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Zheng Yongjun <zhengyongjun3@huawei.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] input: serio: convert comma to semicolon
Message-ID: <X9Pd0597M70pqFmY@google.com>
References: <20201211084957.2540-1-zhengyongjun3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201211084957.2540-1-zhengyongjun3@huawei.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Dec 11, 2020 at 04:49:57PM +0800, Zheng Yongjun wrote:
> Replace a comma between expression statements by a semicolon.
> 
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>

Applied, thank you.

-- 
Dmitry
