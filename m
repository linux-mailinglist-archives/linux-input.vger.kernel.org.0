Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59A6910E02C
	for <lists+linux-input@lfdr.de>; Sun,  1 Dec 2019 04:06:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727282AbfLADFt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 30 Nov 2019 22:05:49 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:46317 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726906AbfLADFt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 30 Nov 2019 22:05:49 -0500
Received: by mail-pj1-f65.google.com with SMTP id z21so3590585pjq.13;
        Sat, 30 Nov 2019 19:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=rQr7XNF2CkV0Knk0SxxgNZU5CvZQYbz5vW9aYeoWsq4=;
        b=A6/PGtZag+j6lvjJNB/PcxnJjg1v1PWnsXu6r1NIMIgoRyiH6lxL/uuIGf4Ipvtpjw
         /BTWeMBYHZ32I94RLV1uEOf59e8V95FS0yUcNYdDsTKakbAZPdIK70zZhds6zhnjCXif
         Z6MrRdgzsVJNRk3FcaGs/gv0EBS/St3xrkAxMWMyHcNpu7d3hKv8rGutTW59t6kvdNz4
         Kes3t/UgWM9QZ49PFMRmqhvHQO3/hdWwynSnk0JMSlHuEnK1o91gUP9pkooTEyt4h6fG
         phF7mBcBU5fnUNhaC5sGrw2zN7OpOB0SgMtKMtA987KVGtHbi2oOo4IMJtkRhqsvEU3f
         v7Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=rQr7XNF2CkV0Knk0SxxgNZU5CvZQYbz5vW9aYeoWsq4=;
        b=stnZlLg8ZdIkBqdr6xFs6R9KerI1ohJRzvm3e2UNGhoqMbbENCskHOqACi2kTeqWxh
         252NPv4jG0Q6hX5nF5IS0/NDKuNJJjH681qypM7VfoBRjrGnQPqh5Wnjrf4Kx3jYXtdo
         R2puxbcXvwllmwZJDOILEuMdHgthu2XT1lY4XBL6PruUb0LXedFxXAu3fhja7B1C+x9U
         hen15ETvzEnv3HoGIa87ASI0j+L2gq3H1MBPhVvnp+8sFx6vFdS5f7rvV2FPRw3wDYMc
         8hMoxtu7vBNhJrvJ0tFuvjqbiwGrOugyguBvBmCknuNGUE/AqV4+jHw854vgK4c3bbB0
         aXHA==
X-Gm-Message-State: APjAAAXjg2fB6+vJj+Ydl46sloQyT5QNmCGegQvuNGTQulM1DgS0H1rp
        JC4pQgy2Z4vKxLs2l9WuzQw=
X-Google-Smtp-Source: APXvYqxkHMMbw3Lgv2DOuluJOoWIpO9xmCGcngM5uTtlOyQj5gKD3ee1fpmnHBQf5ZSGNEZ5y0gQYQ==
X-Received: by 2002:a17:90a:de4:: with SMTP id 91mr28019984pjv.113.1575169548180;
        Sat, 30 Nov 2019 19:05:48 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id e188sm4572713pfe.113.2019.11.30.19.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2019 19:05:47 -0800 (PST)
Date:   Sat, 30 Nov 2019 19:05:45 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Yannick Fertre <yannick.fertre@st.com>
Cc:     Philippe Cornu <philippe.cornu@st.com>,
        Benjamin Gaignard <benjamin.gaignard@st.com>,
        Bastien Nocera <hadess@hadess.net>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: goodix: request_irq: convert gpio to irq
Message-ID: <20191201030545.GL248138@dtor-ws>
References: <1574850541-13577-1-git-send-email-yannick.fertre@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1574850541-13577-1-git-send-email-yannick.fertre@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Nov 27, 2019 at 11:29:01AM +0100, Yannick Fertre wrote:
> From: Yannick Fertré <yannick.fertre@st.com>
> 
> Convert gpio to irq if not already done by gpio lib.

No, please make sure that dts specifies "interrupts" property. It is
marked as "required" in the binding.

Thanks.

-- 
Dmitry
