Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7621CF9FCE
	for <lists+linux-input@lfdr.de>; Wed, 13 Nov 2019 02:04:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727020AbfKMBEr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Nov 2019 20:04:47 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:40735 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726957AbfKMBEr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Nov 2019 20:04:47 -0500
Received: by mail-pg1-f195.google.com with SMTP id 15so184276pgt.7;
        Tue, 12 Nov 2019 17:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=o7cxUzmwPBP3GfeXd0lbVC86zzrm1gxQxSACBgamOj4=;
        b=nFfHbsP8K9lTmnhw6WxnDKwUJlvx0twKrHvPuZfEx+Ey2OhAEw7OQli9obPawgFaRc
         JMqH/g1ZPs6DZHxKsLUK968jPMG9fP4YzUdxpztBAZ1R/OQsDi5AZ6KTBJSU46TD/mbg
         QeLaeur1ghwtbyMkCW8YqMLdKgdh2Dl38uwzOnbiWQiWg+8Yru9hdivJq1JJ18g2NQAJ
         r7adZhreAlag6CCCeSy3KDkO/405fRO5IbpJ8B5SgaJLEMV+Rx6Z/eQF6LnHkEesUCJ8
         NGpOg2EbZydRythz6EWbW/eI0hfFxvsxLfgZB+mqThAGdMbQG2mw2huB6XYRiDCphCIR
         UhoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=o7cxUzmwPBP3GfeXd0lbVC86zzrm1gxQxSACBgamOj4=;
        b=bd4V/b6eSwhUGdbX4jUppqsoeJ/zYZFMCRZ+k+J/ef0BMZ7QM9u+89xdOOEO5X1Kd6
         vEDmfAkAsUDa5WlJOo6MgFNJIUIQyXb2zStP8DMuwJ4Pj8OfYNPp5B6KK1u0luajqDKa
         HeGRfHh6b8i3dBYb3wBVwpN2Wc+04KAY5ZQsbIUR7EXGTOKvY2bURXTgYa2XnX6wZq2f
         mtnSfh/viMw0ypQfLHCkRbxyIP3zgUpXuWafo3DwgCpiVYomcP7HESUsX1Lzm23WP8n4
         x4Whac5JDZ+QpuvPzjIpT3Vld88Rgr+n2DSApJzn142CEqmk/DTD8B2tXK0zNaN1qK/e
         /1Iw==
X-Gm-Message-State: APjAAAWWZVHBdLibGHJCb79ZV5EOIJX6kVip8Hrw/LpGCgQsyClaW85L
        y1qVEDYXwUaSmheCgTaXSEI=
X-Google-Smtp-Source: APXvYqy2zJuNJ2hnpCZwLCUYZdaPeyCBI0UjeVi4HJuv71ode0KwQvcEAFJH1MaTJfIgBGUjoHe6qA==
X-Received: by 2002:a62:1b4a:: with SMTP id b71mr993072pfb.167.1573607086838;
        Tue, 12 Nov 2019 17:04:46 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id hi2sm281267pjb.22.2019.11.12.17.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 17:04:45 -0800 (PST)
Date:   Tue, 12 Nov 2019 17:04:43 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Pan Bian <bianpan2016@163.com>
Cc:     Ferruh Yigit <fery@cypress.com>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: cyttsp4_core: fix use after free bug
Message-ID: <20191113010443.GM13374@dtor-ws>
References: <1572936379-6423-1-git-send-email-bianpan2016@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1572936379-6423-1-git-send-email-bianpan2016@163.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Nov 05, 2019 at 02:46:19PM +0800, Pan Bian wrote:
> The device md->input is used after it is released. Setting the device
> data to NULL is unnecessary as the device is never used again. Instead,
> md->input should be assigned NULL to avoid accessing the freed memory
> accidently.

No, we are tearing up the device anyway, I'd leave it as it was, so I'll
drop this chunk and apply the rest.

Thank you.

-- 
Dmitry
