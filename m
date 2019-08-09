Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71A928806A
	for <lists+linux-input@lfdr.de>; Fri,  9 Aug 2019 18:44:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726411AbfHIQog (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 9 Aug 2019 12:44:36 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:36042 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726157AbfHIQog (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 9 Aug 2019 12:44:36 -0400
Received: by mail-pl1-f196.google.com with SMTP id k8so45195688plt.3;
        Fri, 09 Aug 2019 09:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zHFQ1q9oybjdm+Lhdga3P2zcL4tO7hphnuA5JEFhoLg=;
        b=TLh2Fckj63PDPWgSiCjlGwj61lJL0LpUBylLUf7dt5Z7Gguf8kVDv8Rgved+P8bm0A
         ZwfuSuHXDprOa90uKnhQjiMaSX9ksdUed5VZfQNOGjI70lZPIph2PovfWxkhm5DOp1lx
         9TpeSPh9q9ecHPJagjYc4YBG+mAnMkwDyqKc//ct4FtVh4TmnXisVlE15MHSQC4ImkuG
         KEPsPSohRzIxRnVR1wkosRnXhiCu+ayMZtA7wxyh032ZWDybim/JW3wwLoJNIpuST0GN
         YG6Qm8I2iUmxLLkorP/fkFtUFu80HNQGWlYPUakYDjtZwbE/tPARnhafxknbOKTTBVKm
         g7CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zHFQ1q9oybjdm+Lhdga3P2zcL4tO7hphnuA5JEFhoLg=;
        b=SVJRpUatuqFUnOhEHo8q5ZBUqkZOTD15hkzaoouTkQo2xQJ8sWNBn77dLIqtm6YgDw
         BuaElW/t5AvrLPFv1Gtc5XRlQtwFVlLt4iIUN5PTjIu3TojwzNT/i821sZzQSB8/nDKl
         OwR+QxutPTPBBHj2ID79TvNAdQf60pWfAKQhC0uTNS+oTf2b4qSxeXquNemZlDG2+5i5
         AQid4Z0K+ZhRmyXieu0un7S91QWyor9CB9t8HUKttypRXW/a6nnYmF3ZwCgAije7LKGX
         6b///7SbnJqumoznHlU+xA843QdP5V7Kv7EQl47l546iZif0NI8DOUlr62edzJnTZVbC
         xHfg==
X-Gm-Message-State: APjAAAXs8fx1mWGctwEPICwfJAB7Em1WATW7QgdGHAdDeTfI1TETF6a9
        fK8dov49D094YOsqd8kmqMQ=
X-Google-Smtp-Source: APXvYqyy6Cv8S8ZjMDZqVq/Dgalet3juxVvctgVctdliyTzscyW6v2hMmpOZn8vFCPVkGPt9OeYTow==
X-Received: by 2002:a17:902:ba8b:: with SMTP id k11mr19868176pls.107.1565369075849;
        Fri, 09 Aug 2019 09:44:35 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id p68sm115940943pfb.80.2019.08.09.09.44.33
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 09 Aug 2019 09:44:33 -0700 (PDT)
Date:   Fri, 9 Aug 2019 09:44:31 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     robh+dt@kernel.org, kernel@pengutronix.de,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/4] Input: ads7846 - convert to devm_ alloc functions
Message-ID: <20190809164431.GL178933@dtor-ws>
References: <20190327133927.1340-1-m.felsch@pengutronix.de>
 <20190327133927.1340-2-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190327133927.1340-2-m.felsch@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Mar 27, 2019 at 02:39:24PM +0100, Marco Felsch wrote:
> Convert to devm function to drop the 'no-mem' error handling path and
> strip down the remove funciton a bit.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

I am not fond of partial devm conversions, as this causes reordering in
of freeing resources in unwind path. In this particular case input
device will be unregistered only after majority of the driver structure
is torn down.

If we want to do devm conversion, we need to do a complete one.

Thanks.

-- 
Dmitry
