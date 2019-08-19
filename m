Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25380951F2
	for <lists+linux-input@lfdr.de>; Tue, 20 Aug 2019 01:54:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728761AbfHSXxL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 19 Aug 2019 19:53:11 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:36756 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728862AbfHSXxL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 19 Aug 2019 19:53:11 -0400
Received: by mail-qt1-f193.google.com with SMTP id z4so3983698qtc.3
        for <linux-input@vger.kernel.org>; Mon, 19 Aug 2019 16:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=AIDRHw1/KiLr7UmXvp2zhI8Bb1peNbuqWd3BSli0jwc=;
        b=Kbazf/u3dEUS6lE3K152lxnBk93g038woC5OXn4RRZKUi/vf88p+9Y9tt6NwfP+T0m
         1rNFVgLM3b6YOdsE/UZjpy6KYBPPBTVoZgS5dytw6BwQHB7P0YggksJsKzNgA4IqJd1t
         aavS1q2nDiJIsiUZZ+M2+HESurCvanWHefweTB6WWUval7EDTWQsnsvUlwsPeEYtJRzP
         zrSGiYrUgJMSo+wXP2p3B2a+J5j4ZnhYxBK1SNCI+w5K5m1qFXsh0Bpl8Ml1YzQLHpfr
         YGHaLWKPavdwVvAKCHiYGuZofSU6lYOzAPpJFLiAdhUk7mtWsJIiJADEeR7B+F8Q0ARc
         Bugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=AIDRHw1/KiLr7UmXvp2zhI8Bb1peNbuqWd3BSli0jwc=;
        b=ujQWqg7FDq/xY2u6vLoUkyGJaYh20wvjQeOuKQkeDWLSX1xFJqgcflvz8U2wMPx4N0
         EUjBKsPRi6MQlacGGbFDz8TGR6j8MLM3MMPd10F1e9xc/y7aOBzWsTgfNinqYXG4KV4C
         dJcxwp3Tn7a1myES5tmbBDEHBQgb5oz+8Hf3DjsO8GPkxs5VsMxTkxAdEJmLUS1u7UBM
         zAllD7PtaLiM2CBp6A4//0BICaDWZVJXfo6cM6GVnFSC5ex9hdgRM2Io2GsS6ESjj4PZ
         Yq/uvnBw3uhezXkoiMaelR3w7b4jO5bLWUy88i+nBNeu43sBAw9+wQ5WLvjw1zNavi4k
         Yqrw==
X-Gm-Message-State: APjAAAXJxT0tExUNmrfAau8mKILMpwmI1NQ1wwUeR6qYLX0EOmCGpDag
        pgdX9iU4C/KvAgYU01re22HZsw==
X-Google-Smtp-Source: APXvYqwTgEEQlq2YXaR7J/GtQXUoLzZ9unaM7PLFTbLMXdenWb/uDryZMnhzbUXgXQYrq3LZ47NVhA==
X-Received: by 2002:a0c:c93c:: with SMTP id r57mr12120231qvj.226.1566258790089;
        Mon, 19 Aug 2019 16:53:10 -0700 (PDT)
Received: from cakuba.netronome.com ([66.60.152.14])
        by smtp.gmail.com with ESMTPSA id q13sm7761210qkm.120.2019.08.19.16.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2019 16:53:10 -0700 (PDT)
Date:   Mon, 19 Aug 2019 16:53:01 -0700
From:   Jakub Kicinski <jakub.kicinski@netronome.com>
To:     Thomas Bogendoerfer <tbogendoerfer@suse.de>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        "David S. Miller" <davem@davemloft.net>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Evgeniy Polyakov <zbr@ioremap.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-input@vger.kernel.org, netdev@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v5 09/17] net: sgi: ioc3-eth: use defines for constants
 dealing with desc rings
Message-ID: <20190819165301.4922e86b@cakuba.netronome.com>
In-Reply-To: <20190819163144.3478-10-tbogendoerfer@suse.de>
References: <20190819163144.3478-1-tbogendoerfer@suse.de>
        <20190819163144.3478-10-tbogendoerfer@suse.de>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 19 Aug 2019 18:31:32 +0200, Thomas Bogendoerfer wrote:
> Descriptor ring sizes of the IOC3 are more or less fixed size. To
> make clearer where there is a relation to ring sizes use defines.
> 
> Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>

Reviewed-by: Jakub Kicinski <jakub.kicinski@netronome.com>
