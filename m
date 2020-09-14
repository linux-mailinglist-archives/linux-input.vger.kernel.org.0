Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7C99268473
	for <lists+linux-input@lfdr.de>; Mon, 14 Sep 2020 08:09:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726208AbgINGJy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Sep 2020 02:09:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726204AbgINGJu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Sep 2020 02:09:50 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10334C06174A
        for <linux-input@vger.kernel.org>; Sun, 13 Sep 2020 23:09:50 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id d6so11697473pfn.9
        for <linux-input@vger.kernel.org>; Sun, 13 Sep 2020 23:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=1ABMc75YjWKsVtFv8SIjf3kyAwZ4Ud1IQ/XDxaPYCaY=;
        b=FBGEz7mJ7cyWfVWwqlAkA3yHIC4K8NN38xPZ92LhWuvj9P+/o/vxA9Frf95VGLVw/6
         hOm2MWWImR+p5nyPPl5F3XwtcAbdU+p8qdi/3gMZ06RIasoOAgZM6jqVCmugTlZLgDM7
         jOlmnJwhyXqO7nnkJ7qOf39gwhh1Aey3ihv8/9KJcdk4KF+F18yPbyQ/VwJY2kFPDlnW
         WUNilo4LG+aEmJa+kpoxbNIWXvwGKwUD7fn4LXagigeHDaYTWDz4jBx0oppdNplnYaOd
         zbSwk8Rb6Qzf3Je55kUGLzrkeUNU+I+iBE7SS3QmKjDz/6cLQvvzpbiDxpdlpwjtNuba
         W2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=1ABMc75YjWKsVtFv8SIjf3kyAwZ4Ud1IQ/XDxaPYCaY=;
        b=rdjP8mROwppj/i9qjym9G23vR+3YAGeaa4duojrFX1naqOO8uVT/TRZRJxSrMoHCMd
         GRI6ZhJ+PUejEtHRX0nX8+tA5sUDo1nab3z8wwsrNZsWVE8x31Uyg0yjGbUNu8Ci/AWa
         m8DKumFa5qK0r3iOQXX9QonjYLZWztieLx6SQea7YxWXWSwZbROGW7QnI1burdbqdLDc
         PJ3BYJCTt0LnX2qUHX7+2QcFb303IUc01ljdWsCdqp4ZHf8q6PZ4rWUt9YQOUtVLIY5N
         DAAeUrldzvcuvMN4xj/2aWBNJHXW2D1HD6XyD3T+EcQYnKmZaWp4/5vWvb/Jz5xqp3V1
         rIRw==
X-Gm-Message-State: AOAM532PLxupgGOnhLzacZVD+Q+4BfasUgPYD1T6vNizzqJbeeZ4bghF
        P6fU8EQNoH7sxgNM1rWLIH0=
X-Google-Smtp-Source: ABdhPJzIhzoTcQZfNR3a3+k/2ceDad0LDaWrBUYuN4YuC3ZrLAKq7QGj1q02/c8ZMRp2zXX/+618WA==
X-Received: by 2002:a17:902:d909:b029:d0:cbe1:e716 with SMTP id c9-20020a170902d909b02900d0cbe1e716mr13052707plz.36.1600063789484;
        Sun, 13 Sep 2020 23:09:49 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id s20sm8889493pfu.112.2020.09.13.23.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2020 23:09:48 -0700 (PDT)
Date:   Sun, 13 Sep 2020 23:09:47 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH resend 2/2] Input: soc_button_array - Add support for
 INT33D3 tablet-mode switch devices
Message-ID: <20200914060947.GM1665100@dtor-ws>
References: <20200826150601.12137-1-hdegoede@redhat.com>
 <20200826150601.12137-3-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200826150601.12137-3-hdegoede@redhat.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Aug 26, 2020 at 05:06:01PM +0200, Hans de Goede wrote:
> According to the Microsoft documentation for Windows 8 convertible
> devices, these devices should implement a PNP0C60 "laptop/slate mode state
> indicator" ACPI device.
> 
> This device can work in 2 ways, if there is a GPIO which directly
> indicates the device is in tablet-mode or not then the direct-gpio mode
> should be used. If there is no such GPIO, but instead the events are
> coming from e.g. the embedded-controller, then there should still be
> a PNP0C60 ACPI device and event-injection should be used to send the
> events. The drivers/platform/x86/intel-vbtn.c code is an example from
> a standardized manner of doing the latter.
> 
> On various 2-in-1s with either a detachable keyboard, or with 360°
> hinges, the direct GPIO mode is indicated by an ACPI device with a
> HID of INT33D3, which contains a single GpioInt in its ACPI resource
> table, which directly indicates if the device is in tablet-mode or not.
> 
> This commit adds support for this to the soc_button_array code, as
> well as for the alternative ID9001 HID which some devices use
> instead of the INT33D3 HID.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied, thank you.

-- 
Dmitry
