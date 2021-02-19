Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACD6D31FEDB
	for <lists+linux-input@lfdr.de>; Fri, 19 Feb 2021 19:38:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229546AbhBSSic (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 19 Feb 2021 13:38:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbhBSSib (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 19 Feb 2021 13:38:31 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87264C061756
        for <linux-input@vger.kernel.org>; Fri, 19 Feb 2021 10:37:51 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id y3so606192plg.4
        for <linux-input@vger.kernel.org>; Fri, 19 Feb 2021 10:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ublQo9Fu5ULW7pS29Rpq8h50ARZetDyGJ45Wp2ZTOnk=;
        b=JP77N7IgXqjzFCUHseBDHy/41YlAgFGrjCCW6EIjwtI5BqY3W4cdsSkRV+WTvDwWK3
         cGRTU71dNcHrkcx/+G4cBJZ+RoDCc5icX59Vu4uBwmvROnWjW4EEpcC/5TyXzf2GYpZg
         +wg8Kc8Z4hkyJQuInekmD41WXt+O5Ra3JvDrGHfsj0tZAoooG1fXIUZMcl2owV5zYOFT
         cbbyiBQRXy5fMbNQqrZP362HePUTcXNiXUIBu7Cto9F/RZYMU23C35/GpvxlbHy2Ei6g
         cI78/tLcE24x58ZGiAHhE7ngk1i4rLDpj2Io9b7YHzhbKF1TIl8QF/hIRxsQKt4LZmBz
         q1rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ublQo9Fu5ULW7pS29Rpq8h50ARZetDyGJ45Wp2ZTOnk=;
        b=VpBxqj1mO0DIwfQDEzy7v5Etby4SipuC4rrooLaQ5xTodxNKeQOsHhJGCPvb9llv97
         aea598/ZHrKl+n4aKdw90uMtCCTFAKpytDH3iaWHYwA/h5L9RjOLlFObGoGG7lK/MNsN
         CbS/YR0DkrXCAxnNF6bPwFw9goDxW+037mR8jjfhm8qEUMOiIfyJo50d2QUWumKYWHTW
         oIfIz/O2z+TpQYG8Cgoxj6yKE/rBRNEYFsrm8b88fPLMHiiYD0pJ0xfcpWUITVaxgKNK
         Z7o5HN8kGfCCLgOGExIMOJir2h+AaTF659F43fcioOs0jadLmBzsYO+mIWe9RpfA4ZbY
         SiRg==
X-Gm-Message-State: AOAM530IMQd5sW0bKUUh10JL5Z8TQMjNt7w73LPQw9A9aUzyW8xdzNYE
        fYnlTjnITQZWOrL10JQ4Mmw=
X-Google-Smtp-Source: ABdhPJzfvyv9sgoVxuBw61jp1ZFkLdPz5mg+O4DNlTKciICJ15HFW+2+mB8uUwfGO14751MaiEgTxg==
X-Received: by 2002:a17:902:9f94:b029:e3:287f:9a3a with SMTP id g20-20020a1709029f94b02900e3287f9a3amr9916936plq.46.1613759870991;
        Fri, 19 Feb 2021 10:37:50 -0800 (PST)
Received: from google.com ([2620:15c:202:201:7d43:dae1:3b24:51b7])
        by smtp.gmail.com with ESMTPSA id o188sm3063660pfb.102.2021.02.19.10.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Feb 2021 10:37:50 -0800 (PST)
Date:   Fri, 19 Feb 2021 10:37:48 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marcos Paulo de Souza <mpdesouza@suse.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: i8042: Add ASUS Zenbook Flip to noselftest list
Message-ID: <YDAFfL8sdPQeebpL@google.com>
References: <20210219164638.761-1-mpdesouza@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210219164638.761-1-mpdesouza@suse.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Feb 19, 2021 at 01:46:38PM -0300, Marcos Paulo de Souza wrote:
> After commit 77b425399f6d ("Input: i8042 - use chassis info to skip
> selftest on Asus laptops"), all modern Asus laptops have the i8042
> selftest disabled. It has done by using chassys type "10" (laptop).
> 
> The Asus Zenbook Flip suffers from similar suspend/resume issues, but
> it _sometimes_ work and sometimes it doesn't. Setting noselftest makes
> it work reliably. In this case, we need to add chassis type "31"
> (convertible) in order to avoid selftest in this device.
> 
> #Reported-by: Ludvig Norgren Guldhag <ludvigng@gmail.com>
> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>

Applied, thank you.

-- 
Dmitry
