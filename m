Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 699FE472023
	for <lists+linux-input@lfdr.de>; Mon, 13 Dec 2021 05:56:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231769AbhLME4v (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 12 Dec 2021 23:56:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229990AbhLME4v (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 12 Dec 2021 23:56:51 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68306C06173F
        for <linux-input@vger.kernel.org>; Sun, 12 Dec 2021 20:56:51 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id np3so10999017pjb.4
        for <linux-input@vger.kernel.org>; Sun, 12 Dec 2021 20:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=du4UFE0SKFwT9RW31CXVTQP66EfunK02VX1K0k17WsI=;
        b=VRdhB8XW5zXYwk7sUtupD6FmJwod4+d6XGdlGjymbjDblwibrs03S0mRi1wmRRAKjs
         h8/Iy9/bc1uTkXlho3k0h/3rMX6kXSTfQwAQ9XA9+l/ssB6WDXyg+ji0WiJdmUHsA3FZ
         6526taLavEaUItAiZrwKACi14MB6kYO4o5vRmWFKfO4S4GQxjALtNpEqiEWrCeJu/9cj
         Jls7CFu+PawZWEqkWIPV+vTV0dLFM2PqWGQG4RWABWivApXX1JMGO4YfGYc1PgTQ7RfC
         MOvmHJ1QJA9x+ycD/1Cn7zd1GiDSPKsTTI77vCzK6YRLqdApUgGHMUHzMYKvAkDJtEJr
         TQHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=du4UFE0SKFwT9RW31CXVTQP66EfunK02VX1K0k17WsI=;
        b=CD4rkTGjoHizDmeml9VwSCiUygqZiZtsdPoaVNH4toBQmZeqkcJDCuzF+QUYxQGU38
         Ya2GFAcL1m0vqGSuuZzAut3uPqPQdKunu8C/PvmMv+/wxoS3C/ubYWpTPxE4jBYMvAp9
         76WmXBPtRGWTZlMBsnxPd3wzHL3fzjY0jWxHkbJ2J+YhQweRfhvstCIXr+XdKLx2F0SW
         BWHI0AGJ38oXPLacifIxhg9zoMKlOa+lCkl5aEpKEZ/1Bn49yC3bnoAIXAnF7sVXdRpI
         loGUpQizTRkkHkz5LJwFmi4BwnJQoXnTjHYJb1NOo3RxtX+FKVAeqhbx5OVeMCyV3+em
         FubQ==
X-Gm-Message-State: AOAM533xOKRgOD4BmxRLv0EPOPlRfmAPhmpnpmSFusKxOhvWXVxPJ9za
        U4HHAtfh5x5pJ/nBtHwEd8Y=
X-Google-Smtp-Source: ABdhPJz+hL3E1wh6vqBUAJ0l3mG6FLzPcxKwRAh0VAjmza32v4v8yTyqUr6Bchxr9gf4oF9oh6i4+Q==
X-Received: by 2002:a17:902:a714:b0:143:d007:412f with SMTP id w20-20020a170902a71400b00143d007412fmr91391772plq.18.1639371410915;
        Sun, 12 Dec 2021 20:56:50 -0800 (PST)
Received: from google.com ([2620:15c:202:201:e537:8856:7d40:7c6])
        by smtp.gmail.com with ESMTPSA id a64sm2823210pge.72.2021.12.12.20.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Dec 2021 20:56:50 -0800 (PST)
Date:   Sun, 12 Dec 2021 20:56:47 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
Subject: Re: [PATCH 4/5] Input: goodix - 2 small fixes for pen support
Message-ID: <YbbSj3TQhQmQjfag@google.com>
References: <20211212124242.81019-1-hdegoede@redhat.com>
 <20211212124242.81019-5-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211212124242.81019-5-hdegoede@redhat.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Dec 12, 2021 at 01:42:41PM +0100, Hans de Goede wrote:
> 2 small fixes for pen support
> 
> 1. Set the id.vendor field for the pen input_dev
> 2. Fix a typo in a comment
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied, thank you.

-- 
Dmitry
