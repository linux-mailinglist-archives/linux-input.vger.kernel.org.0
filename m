Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5602F99E83
	for <lists+linux-input@lfdr.de>; Thu, 22 Aug 2019 20:16:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730411AbfHVSQZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Aug 2019 14:16:25 -0400
Received: from mail-pg1-f173.google.com ([209.85.215.173]:33895 "EHLO
        mail-pg1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbfHVSQZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Aug 2019 14:16:25 -0400
Received: by mail-pg1-f173.google.com with SMTP id n9so4140450pgc.1
        for <linux-input@vger.kernel.org>; Thu, 22 Aug 2019 11:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=W3kptTBslAzPXBCKsTvqtwxGrUy+wu1JabpYbyy8jr0=;
        b=FQvwb1l0qaJiB0P7pZso/2IHFpgCW22YpAKockn3LCukG7qeiKcNGjmzs+wx1baAq1
         hjvTZdFgkBBzf2cIKfSoRkxIzTL1APsrGmPR/R85R/R6uqTpSvqTa2j920Xqopt+x/Vt
         Esd7GWZrirvkmlKFP7e13xKJsCfSw3gitZIQiEyGI9DuofrtL5NYOAJUBFY9bfGCpVRW
         RyGRrkqEMsAyrefMtEig7wrZmKmRk8pWSsxTBl1udM6FJFbtsw/IA9u+ARCpycdYB9Xl
         p1MvUmjtovS8RGBHAy1zdp/rGXUcrQxE7UJx7LNl+DRHo87JDLJYQ1bRiCZGFa729gUf
         /QNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=W3kptTBslAzPXBCKsTvqtwxGrUy+wu1JabpYbyy8jr0=;
        b=lr1DcMHe43WHeLYjEf2heayzvGCGf4H0F9Zda7a49f97qy6UU0C/mdSpW+umsFSs9P
         uvszxdSuAGObCw1kkuH7gCdU/0JU2QKaKL1nuPStnRgiDWZx5ba3Qw9SrdysCc8znJNA
         9A/I2FcJJO8aI/b+QnxV3aZQImaHyLbHqeTfktVZ8RhSGDF1EIgKZKlZcnbbRq1zvmfh
         pZeK7iErBcQAI8PsFyYUZ6VJz1fTvw1HrRz8Kd5y3yDgZUir1eoRK1hmkbyqA1IZnOVK
         x3u1iZwll8kwe0BmZb2qk9B/dz5XGGyvHZI3pmOZZ6+fphru3nQcB2/1fTxiJmcDVa1f
         /azw==
X-Gm-Message-State: APjAAAUDM519EtRZBbMj3xJ3lZ0m0rx+SHUmqv2Ao4N8T0NcbTKNxiB9
        d5k46DbT7YEbEc66dKE5gDQ=
X-Google-Smtp-Source: APXvYqyiqpbRnqs1D4820DbRQSb4fOCe75D5lzhtL3p1Nfa54wWStJlIXvFXrdC45TFxS00RICp/yQ==
X-Received: by 2002:a63:b102:: with SMTP id r2mr466093pgf.370.1566497783999;
        Thu, 22 Aug 2019 11:16:23 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id f27sm23033pgm.60.2019.08.22.11.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2019 11:16:22 -0700 (PDT)
Date:   Thu, 22 Aug 2019 11:16:19 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     bgoswami@codeaurora.org
Cc:     linux-input@vger.kernel.org, alsa-devel@alsa-project.org,
        perex@perex.cz, tiwai@suse.com, broonie@kernel.org,
        srinivas.kandagatla@linaro.org, plai@codeaurora.org,
        Gopikrishnaiah Anandan <agopik@codeaurora.org>
Subject: Re: [PATCH 2/3] input: Add SW_UNSUPPORT_INSERT define
Message-ID: <20190822181619.GH76194@dtor-ws>
References: <1558730438-16524-1-git-send-email-bgoswami@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1558730438-16524-1-git-send-email-bgoswami@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Banajit,

On Fri, May 24, 2019 at 01:40:38PM -0700, bgoswami@codeaurora.org wrote:
> From: Banajit Goswami <bgoswami@codeaurora.org>
> 
> Some devices may not support specific type of input devices. For example,
> when a headset or extension cable with GND/MIC swap is plugged into a
> headset jack that does not support the headset/cable, it needs to be
> reported with a corresponding input event. Also, increase the max values
> for INPUT_DEVICE_ID_SW_MAX and SW_MAX, to accommodate future extension of
> the number of event.

I do not think that adding this switch is a good idea as it will not
allow you to easily extend the reporting and to convey to the user why
something is not supported. I would look into alternate mechanism to
signal when and why a headset/peripheral was rejected.

Thanks.

-- 
Dmitry
