Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8B4F396D10
	for <lists+linux-input@lfdr.de>; Tue,  1 Jun 2021 07:53:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231607AbhFAFzT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 1 Jun 2021 01:55:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230326AbhFAFzS (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 1 Jun 2021 01:55:18 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48426C061574;
        Mon, 31 May 2021 22:53:38 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id v12so6268633plo.10;
        Mon, 31 May 2021 22:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ywm1CFODQx9V68FNXN3B4O+bWdOP7A+5PSUNgJzNBRY=;
        b=LS3+9ge3vyxtyA0sbiQk3ZslWbS1jyXHZWk3dkMVTn2XDfUc4lCEmTwpZ4UQTWesYb
         dgAOoWKblobXhuFmmP5EiR9pFe+WVyhCaOZAp6XB908KJB/asQLfRxcc5Qj78QvjUqlz
         uK/OaCzkvCxqmbU6oE+gzoOsR+SfXhxsA/KepkNP74etCFyhb8anQ7Ia0fz+FLaunamy
         UqC0VUer8possgk/mditrn/5hJAv1vO9Io83xQ0TJQiL4PyrQE6lXAJLq9YjvaIy8N3I
         egh7L9g92OtRLja4HIJc8ZVhLWk7f4kqrqGdZ3xETKKM+LOiMevc1lt7wbJyTny11T5E
         9c8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ywm1CFODQx9V68FNXN3B4O+bWdOP7A+5PSUNgJzNBRY=;
        b=OEcj15eeQdSRRa02OSDo2OpgLfS/9JQ+4ZfPrF3/5CKmDKull3pT2rBc01E0Szj7Nb
         /7CS5xlmdPGuZ5KMgkcIIxZaOKEm0MOXeMyb4jIiEm42NOTFGpuK5/6/6ACCQEZVbC7C
         CN/poT92O3hbxUjZHxhh5Zr6rMqsJ989OcALI0MaQEVQNOV6ymFr6bgzjUCPaj0ohorP
         oHzD98ruLt/bgqlcfSEpbvYY5bkf9ABgJihXaH9dSbc67wGUCjWB3pROWIqBsdIO2F7M
         Nhfb6WoAd8aW4Nk+2kC3nojJNuHfx4i19OWwAMsipATkaKo4ax2kxjgaMyh1U+hId3XV
         55cg==
X-Gm-Message-State: AOAM532OPVH5tDcEupFsVQ6UGCFjJ7BS4GKhYiM1fH4qFA/a8BsJocZ4
        SVbuxwF7ogZ/P4c4RVwxkje0E9/6vKY=
X-Google-Smtp-Source: ABdhPJzWR8PxKq9Os7X78Yjcqb/o7sUIYgFvfMZwlTVg+7QXpdsdbMQgopeEI9ZHPo/KkaeQcHG/9Q==
X-Received: by 2002:a17:90a:dc82:: with SMTP id j2mr3131184pjv.138.1622526817648;
        Mon, 31 May 2021 22:53:37 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:f313:c4c:d05e:895b])
        by smtp.gmail.com with ESMTPSA id s29sm8503225pgm.82.2021.05.31.22.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 22:53:36 -0700 (PDT)
Date:   Mon, 31 May 2021 22:53:34 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Oleksij Rempel <linux@rempel-privat.de>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: Re: [PATCH v2 2/2] Input: resistive-adc-touch - replace OF headers
 with proper ones
Message-ID: <YLXLXlSPWtrdUImq@google.com>
References: <20210528151113.85943-1-andriy.shevchenko@linux.intel.com>
 <20210528151113.85943-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210528151113.85943-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, May 28, 2021 at 06:11:13PM +0300, Andy Shevchenko wrote:
> The driver is actually OF independent and doesn't need anything from OF (*).
> Replace OF headers with mod_devicetable.h and property.h.
> 
> *) use of of_match_ptr() is actually wrong here, since it may provoke
>    a compiler to warn about unused variable.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied, thank you.

-- 
Dmitry
