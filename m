Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB0CD3307A3
	for <lists+linux-input@lfdr.de>; Mon,  8 Mar 2021 06:44:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234578AbhCHFnu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Mar 2021 00:43:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234573AbhCHFnt (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 8 Mar 2021 00:43:49 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E258C06174A
        for <linux-input@vger.kernel.org>; Sun,  7 Mar 2021 21:43:49 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id j6so4323260plx.6
        for <linux-input@vger.kernel.org>; Sun, 07 Mar 2021 21:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=p3HE7oUHY/52LIVObvnnflIVSZbaxRFp+LOKfViNOIs=;
        b=oksNt4k9+0Xa/QPeMGQM4R6SU/ibt5nphIhTqYT3z+04sWGeKJ+yxJlHdmQC7+CqO6
         ZHGfcMIhPFncL16RAXp0pySYXEduGLcPkREbFG+4DrzBK4F07I/OzSa2NXb2EarvD+YZ
         kDjppAYU+UbWmD6B0Num/jbgpBowUggyNwfHe848GNeyoXMUWBvSIRTEFcx3//djJhVn
         dBJ/hvVUolyb486cvJycQ6XPoKvX3d30xA8qhOHAXvswBjZPjuNhEpDn7LFPIIou0uQZ
         uiyxPB7ADjvkf88JGWCMRd1oBk0/gn9pFtYBrJDM+pZjpO6cLcVvI+TuV6f4TCD6MSJT
         /QiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=p3HE7oUHY/52LIVObvnnflIVSZbaxRFp+LOKfViNOIs=;
        b=S+3mUMimQo6nBrPQlGMYdy67uu3pb54w99jbmKdq4D1K9ZesRqEpnABMpTV+A4GtXP
         W7Cev0qHSBKaV4k9s+bzuoIqcT5HbPfB8SS9Iv9MQ9at+QgN2R38dfhJfVanxKgwXjI9
         Sh3H545T5Bip3HlgK+2hbr07BDMz3J9gTR9b2epvieOXe78jlMEPZD1esSCMMcdlOHo4
         2MxBdDsQ7/QKASa8hAIt4EoIlHYfmVR+PIlFZBPWzw+eKDw1JLFDfRqZ4oFEKz0ULCxP
         utliWf++01OzybAXLwUP9w9Sh8xAX+fcOkhBnjHIZ2Sa1/5w7tScHJl0XbSmPI7gbOxw
         Uwiw==
X-Gm-Message-State: AOAM530RDJ9XVaxVzALsllhJmkHEHq2jF+hlp278HcQ+kMdOYyQ6xTBH
        Kq3+MV6KiT40mWMS9ySQdfVfl0RawNI=
X-Google-Smtp-Source: ABdhPJxcn6azliLfifrFkTNAS98n6bK3c88EYE5odxsLIMb1EICxNhS9TESI3pSZdvi2udsKPgm8LA==
X-Received: by 2002:a17:902:7006:b029:e3:dd4d:85ac with SMTP id y6-20020a1709027006b02900e3dd4d85acmr19404575plk.41.1615182228372;
        Sun, 07 Mar 2021 21:43:48 -0800 (PST)
Received: from google.com ([2620:15c:202:201:39e0:7b5c:9fa7:f6e0])
        by smtp.gmail.com with ESMTPSA id v1sm8674296pgh.17.2021.03.07.21.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Mar 2021 21:43:47 -0800 (PST)
Date:   Sun, 7 Mar 2021 21:43:42 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lucas Stach <l.stach@pengutronix.de>
Cc:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-input@vger.kernel.org, kernel@pengutronix.de,
        patchwork-lst@pengutronix.de
Subject: Re: [PATCH v3 1/5] Input: exc3000 - split MT event handling from IRQ
 handler
Message-ID: <YEW5jsyYNclCTdly@google.com>
References: <20210125182527.1225245-1-l.stach@pengutronix.de>
 <20210125182527.1225245-2-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210125182527.1225245-2-l.stach@pengutronix.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jan 25, 2021 at 07:25:23PM +0100, Lucas Stach wrote:
> Split out the multitouch event handling into its own function to allow other
> events to be handled in the IRQ handler without disturbing the MT handling.
> Now that things are separated a bit more, stop treating vendor data requests
> special by cehcking for a locked mutex, but just look at the event ID to
> figure out if the message is a MT report or a vendor data query reply.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Applied with a small change in switch() {} formatting, thank you.

-- 
Dmitry
