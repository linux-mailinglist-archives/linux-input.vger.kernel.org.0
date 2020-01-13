Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8380139B60
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2020 22:26:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727382AbgAMV06 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 13 Jan 2020 16:26:58 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:41787 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726778AbgAMV06 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 13 Jan 2020 16:26:58 -0500
Received: by mail-pf1-f196.google.com with SMTP id w62so5484565pfw.8;
        Mon, 13 Jan 2020 13:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vEnJJpWocYAj5XvANgl9lb1cypNvsSiTKTDWo+Q3WUg=;
        b=Ddn9mZKvyLny1v2AIENYWGnTnSLGTYQJ6xaz5UrSUR5xcwB6B2ZCSAFxAguduZ8Dl6
         cFLnFkB4jIeIm28iqtdzI7EWHeGMvZbDv4zqAD4xpe5QD+5l5OT29wWyMRQ44+0uk96R
         2kDqT3BwvA3I7nnh5OniKt6zYP+yEv4gH0a60x9gZK+VRygdwvRoSSLX/qQRfzAM7tCF
         iHPPjw7UdnjBZy634zn8gWQa+MB/ZOpvw9GEBP8VuNCFMg267hQ7+4fHN5dCeWpwMJrL
         3HljTEvYRx/wI9TDQyRebi5L2YgPy2zbVYcBQAC4T8Xipc/l3f8rK26dAIZj3ctiCxNX
         nmtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vEnJJpWocYAj5XvANgl9lb1cypNvsSiTKTDWo+Q3WUg=;
        b=mtk3oRuAPXhK8nf/wIwhruuSCvXiprPIs82hvW/iSLDn2ttg+uv9HQRKN3uHXaDD3Q
         zplG6QCa7Wsz77XFFCJCSpFdidLbIAEOhjl4HcG/2J+AU6sqynUdG/r6+tiIiiqjT2iq
         /Tm1aBUlsw7wvAyxdytGZiPW4QioxoBVltrUPaUPGIsms32cNkx0nh5dbnyAweNsoH4b
         bsUjLHiGr9cKMkdYgBHuTBEd2t4OhpfMSvHd6diKMb2KykVJxLcNlaeui/FWJR63m+Gn
         JB2ldbCrx23RINEXXH86Dw6u2ETdvf1HDYj9o3urRo7qa0aqpxrUq5zhZWa23SI4azeO
         QjqA==
X-Gm-Message-State: APjAAAVtGoCVird0Us8J6pY9+lL0bhoyyEvL+2ZmOhEMhmUyifGqfj5w
        ppjEoRbvCSTFO2lVQKnGtac=
X-Google-Smtp-Source: APXvYqz2eZ4JatdmAtdvpqaabqyJ66RVwZ2vFkvSbHWq3dkNPQARX/lRh9b5I8BRkCVzL50vq7NJ4Q==
X-Received: by 2002:a62:28e:: with SMTP id 136mr21278018pfc.256.1578950817073;
        Mon, 13 Jan 2020 13:26:57 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id e9sm14938339pgn.49.2020.01.13.13.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 13:26:56 -0800 (PST)
Date:   Mon, 13 Jan 2020 13:26:54 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Chen-Yu Tsai <wens@csie.org>, Hans de Goede <hdegoede@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: Re: [PATCH 3/3] Input: axp20x-pek - Enable wakeup for all AXP
 variants
Message-ID: <20200113212654.GA47797@dtor-ws>
References: <20200113032032.38709-1-samuel@sholland.org>
 <20200113032032.38709-3-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200113032032.38709-3-samuel@sholland.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Samuel,

On Sun, Jan 12, 2020 at 09:20:32PM -0600, Samuel Holland wrote:
> There are many devices, including several mobile battery-powered
> devices, using other AXP variants as their PMIC. Enable them to use
> the power key as a wakeup source.

Are these X86 or ARM devices? If anything, I'd prefer individual drivers
not declare themselves as wakeup sources unconditionally. With devic
etree we have standard "wakeup-source" property, but I am not quite sure
what's the latest on X86...

Thanks.

-- 
Dmitry
