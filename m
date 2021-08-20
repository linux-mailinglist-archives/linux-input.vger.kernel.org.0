Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B0943F2FB4
	for <lists+linux-input@lfdr.de>; Fri, 20 Aug 2021 17:42:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241128AbhHTPmg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 20 Aug 2021 11:42:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241045AbhHTPmg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 20 Aug 2021 11:42:36 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25A36C061575;
        Fri, 20 Aug 2021 08:41:58 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id t66so11356776qkb.0;
        Fri, 20 Aug 2021 08:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TD7UO1vJGwoGQ4AHaMGplRumS39Xg7e9O3vaqdkaZ5U=;
        b=SJaUzvFitYP7TFhiy3lgxeXWaBq932MSG8nV37JOmsJKQQOwfvYzZtMzWu9JkVa11g
         PYa8xrz+JEcRNf4xOufuPELYvRmozfYBnZMEw6oKUQgO4mKPTKCktNNUvyOlON9AX8Nc
         4HNjc3c0Nu0S9Hl+MI1ovbVthOb+yfk4kItIo/XTHiEK9o0sda40IGwb+l4MGPMeNJvZ
         P7QnOW7iUZNnfA6qJGPXw+06sx9M1quI6Fxl/4VhEEUIyH+pN/7VMkwjvHFcA6KUKKS0
         HRbblI7ktfN9ci+3zTFXviWk1lH6l1wjDZR+uJbxMb9SIwDEG9NQ7u384CwoFUQKOyhq
         zsDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TD7UO1vJGwoGQ4AHaMGplRumS39Xg7e9O3vaqdkaZ5U=;
        b=Ezrwu7DXWO/YsMOw9WQXv+8I9Tu/NBCnEGOqx8ohHGdwsF6hIaJ13VEjFxWdkPhZK1
         vYM9C6e+0O8R3zdlZS1TPpzst8h03k7i/zE5AWC4eL1+s6B9ACQ1hlKHGMImlU7Z9iTx
         BADeTQKKar9xseEhG27GSD6GieQnyZAGX9bdu5ibIU1DUlhtywzif/SYMqG/N8rtgs+4
         nHI2efG4qV2nrJQPI8Sxu5gpzMozG3sLhr1fQ6xOX3KvxxYkfZ2dlZ8eDCCf3lyrBEbb
         D4vbpqx17uxQ7iOF/sShO59WAnrnTysEwcShetpBERS8rFHa5hAqoM7vNhfi005p6ZWc
         sBnw==
X-Gm-Message-State: AOAM532jYlzHZHkyc6m+pvA0+5CbcOtDOgqFIIj7UtaSzxnLyNCtgSDy
        7sLIbsjbYbqQm5sqZtUvm6Y=
X-Google-Smtp-Source: ABdhPJwX53foXCG5VyO/NCU64TCkvABQkPm0s+1gx7rxvckm/C+niyJBdg+nD7V5LMATb+hM7XKbRQ==
X-Received: by 2002:a05:620a:11af:: with SMTP id c15mr1820768qkk.82.1629474117311;
        Fri, 20 Aug 2021 08:41:57 -0700 (PDT)
Received: from Desktop64 ([138.229.29.116])
        by smtp.gmail.com with ESMTPSA id j18sm3438659qkg.31.2021.08.20.08.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Aug 2021 08:41:56 -0700 (PDT)
Date:   Fri, 20 Aug 2021 11:41:55 -0400
From:   Stephan Losa <stephan.losa@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: apple: Add support for Keychron K8, K2 in bluetooth
 mode
Message-ID: <20210820154155.GB26305@Desktop64>
References: <20210819193221.558454-1-stephan.losa@gmail.com>
 <nycvar.YFH.7.76.2108201506010.15313@cbobk.fhfr.pm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nycvar.YFH.7.76.2108201506010.15313@cbobk.fhfr.pm>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Aug 20, 2021 at 03:06:29PM +0200, Jiri Kosina wrote:
> On Thu, 19 Aug 2021, Stephan Losa wrote:
> 
> > Use hid-apple in bluetooth mode like in wired mode for Keychron K8, K2
> > (and others). Those keyboards use vendor/product ids 05AC:024F (APPLE_ALU_REVB_ANSI).
> > 
> > Signed-off-by: Stephan Losa <stephan.losa@gmail.com>
> 
> Applied, thanks.
> 
> -- 
> Jiri Kosina
> SUSE Labs
> 
FYI

Someone brought to my attention that a similar fix has been already merged
into 5.14-rc4 three weeks ago torvalds/linux@ebe0b42.

Stephan
