Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B28E10EF4D
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2019 19:27:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727742AbfLBS1b (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Dec 2019 13:27:31 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:33412 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727671AbfLBS1b (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Dec 2019 13:27:31 -0500
Received: by mail-pj1-f65.google.com with SMTP id r67so101989pjb.0;
        Mon, 02 Dec 2019 10:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kHId2K1mxfvE9DuGLR1TU18/e9Ev1X6mZeAaw2mVc2Y=;
        b=b6G8gNQPSeawZGHOs8V0YQzs8YlHeA/RXizq1NQT5/x99h7TavgVA7Xj1xt4Rt533l
         zgMrH9rc4tPWjH6ekO5UkNH01Afgc5t+TqwK1p75HjbzcdhAk/JYYbZsNWkWq4mmQxxL
         MyYMN/qETHARQIjgSRt5bCz1XeycOHLk+K8IBPYdf2bEw7dJMqzrd8FvxuE+yn4rWylp
         4hn1iGuwXAUVbU4fMcNyDCT5tKz6Pnc9fzW1rcxpv09llJ2gkq2oOnv22CgY/F5jsFcA
         n16D4FLeAG+3ja4+bBStGnaEdOA9tHaMVxsgWYw1AOtg1YDN5kZR59VU121T9eb0AF/T
         oDzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kHId2K1mxfvE9DuGLR1TU18/e9Ev1X6mZeAaw2mVc2Y=;
        b=QvMaue07GjwZzX4xCvZb954wv3wVQRTcFaS8lmJiAkEQzCumBhW0Ovmku/0fDDCtlh
         anjYCMMFQ0JeRJNb6uoEwb+R9Vrs8eQ030je8JwsaC6+8tTtnMis73sI2PPKW5OTgevP
         9xPRaMZ8iPFP+rRKapNjy4iiDrKLxFAjmLuf1diViVMNGEfS1g/Ql7EpK6BNpFZD68Bu
         3Peh2JQWAjilFc5vT4Nwa/upLEXfUH7JqQHtR3IIu71szA5t0RUydvnVZRPAMUQoyC6D
         xQAHAMcZtsOVh/Pe419h+mJuXOd6TSRv8bmeYaRKps/V4NJLBSM3MwG+IfEt0KKxiN9q
         TVJw==
X-Gm-Message-State: APjAAAWkeylazf5nLM4M61nvfe7xKIjU44DcwRHCkBymMPfJmDM8o26i
        nEcnLB30O1O1Jm1x3rvui5pAZDaT
X-Google-Smtp-Source: APXvYqz0ZxG7eHgkaKqQ5ui+VUs6AKdnFWBt1wkZ5JNGRDYEHiB1cr5JEsPcZMOE/SIqe3ixY8x4Gw==
X-Received: by 2002:a17:902:be10:: with SMTP id r16mr574623pls.169.1575311250097;
        Mon, 02 Dec 2019 10:27:30 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id d69sm155038pfd.158.2019.12.02.10.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2019 10:27:28 -0800 (PST)
Date:   Mon, 2 Dec 2019 10:27:26 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     "Enrico Weigelt, metux IT consult" <info@metux.net>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH] input: misc: Kconfig: use select instead of depends on
 KEYBOARD_GPIO
Message-ID: <20191202182726.GG50317@dtor-ws>
References: <20191121132046.11977-1-info@metux.net>
 <20191122195810.GD248138@dtor-ws>
 <5600986e-239c-88a9-4f9c-ca261c33a156@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5600986e-239c-88a9-4f9c-ca261c33a156@metux.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Nov 28, 2019 at 02:03:40PM +0100, Enrico Weigelt, metux IT consult wrote:
> On 22.11.19 20:58, Dmitry Torokhov wrote:
> 
> > KEYBOARD_GPIO depends on GPIOLIB and "select" does not propagate
> > dependencies, so you may still end up with invalid configs...
> 
> Sure that they don't propagate ? In this case, I've got yet
> another todo ... :o

Yes, I am sure.

-- 
Dmitry
