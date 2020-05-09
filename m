Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA8711CC4B4
	for <lists+linux-input@lfdr.de>; Sat,  9 May 2020 23:28:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728314AbgEIV2w (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 9 May 2020 17:28:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728301AbgEIV2w (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 9 May 2020 17:28:52 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEB92C061A0C
        for <linux-input@vger.kernel.org>; Sat,  9 May 2020 14:28:50 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id y25so2804010pfn.5
        for <linux-input@vger.kernel.org>; Sat, 09 May 2020 14:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sT2PTJcy6t/1C0T6xNdedx2IY51n3YMNajpdq3UzOdg=;
        b=V61t3yGT40HpCFkWbieXVdQQm4yFd1gUzbrWFXTMUx7G8UDPJUgwOZjJwqRqHLQ/2T
         A7/9lEYaA24cgzMlvdDTMCx9oJZ28yg+pg5PZnQxqqVnuWm2SuqKJqZLkxpZZCDxOCai
         +npRBXCAJ3qtVFCTsn/uJf5qmmqkLoBUId3U6EVv+zUP8yrcwSuYqNZzM2HmhvkBFwuL
         CZMXRxRqgzXOVDQx7oQirvIfr62NiahUQhbVSueUHcdQUL3I+ghZZhXQj7YY2FIZDWo3
         FkOs1FIBxihgyj8FtW/AU2DUfkieIylN8cYsUBccEuRhvH5WBqOP9BmyxiFmaaBkH/mj
         M5tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sT2PTJcy6t/1C0T6xNdedx2IY51n3YMNajpdq3UzOdg=;
        b=aBBIsngQIykbSyilkYIyl7CCldbZMYIDm3GUXjdMTa3xYQkerapWgeh3cxmA5Or3Dt
         6wpixpUT4JyEVSAXhqlYXMW+irpchjSmCNTChTKmHwi5lPnSNcOIg8ERka+a+C2t1RdU
         Ckm2v7xstCfb+oCSAwzot4DxYRXm7c7KpUib/bDyD9I2P5f4R0yU+cORtSTIOH0kBFkB
         oTd1Jb+2cyY/jue0q9fYBeW6phR6YP+FgybFlh+w/yslCGSXUvsKJ+XEs6U3vf592sLD
         k7AI1EHYnPMFNH4mf/u3RevehzlTZV4u0KVpdXBIj25wsYiPd8hmxYD2CR9obkrzipTH
         +DjQ==
X-Gm-Message-State: AGi0Puaohgu5h04HmeBQfGPjKoAIiPOkygHd8m/2rcBlxAVCmX0xtxE+
        qKawKN70JiwkvRocOVowUF4=
X-Google-Smtp-Source: APiQypLFdhk7bFDkHRIiJo7IP+WPuURRH0wwNTI45tgy9Q6M8yXae7FWJh1NZwdu8gJ/iheAz3vFYg==
X-Received: by 2002:aa7:9832:: with SMTP id q18mr9703486pfl.179.1589059729907;
        Sat, 09 May 2020 14:28:49 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id h26sm5419372pfk.35.2020.05.09.14.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2020 14:28:49 -0700 (PDT)
Date:   Sat, 9 May 2020 14:28:47 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     andriy.shevchenko@linux.intel.com, hdegoede@redhat.com,
        LW@KARO-electronics.de, linux-input@vger.kernel.org,
        kernel@pengutronix.de, Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [PATCH 4/4] Input: edt-ft5x06 - prefer asynchronous probe
Message-ID: <20200509212847.GQ89269@dtor-ws>
References: <20200227112819.16754-1-m.felsch@pengutronix.de>
 <20200227112819.16754-5-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200227112819.16754-5-m.felsch@pengutronix.de>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Feb 27, 2020 at 12:28:19PM +0100, Marco Felsch wrote:
> From: Ahmad Fatoum <a.fatoum@pengutronix.de>
> 
> Probing the device takes a while, because we sleep for 300 ms after a
> reset; allow asynchronous probing so this can happen in the background
> while other devices are being probed.
> 
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Applied, thank you.

-- 
Dmitry
