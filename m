Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9646AC2AA4
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2019 01:12:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727884AbfI3XMQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Sep 2019 19:12:16 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:33074 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730474AbfI3XMQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Sep 2019 19:12:16 -0400
Received: by mail-ot1-f67.google.com with SMTP id g103so2586288otg.0;
        Mon, 30 Sep 2019 16:12:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=29C9vy1+vRFmsiLAM5YbXIvS9J+pKIiK5hofpG5dRu4=;
        b=WLbfshd7uHszDGWlcMtaOZMyhRm71w/lbS52hT5Y8bszac3wYv6j+URmHC9N34kq8U
         vHmsAAxnBr8twEc6mxm8lHyXRrawn/2PVdVFIHa8q3R5rsFptcIqanir+DtAs8P0VLFo
         UrceVAJU62Y6N8TKZe/P+Azn77piZ+oLr+33sngC8OFT4f2BV0BHNaAd+FZmJp3+vHgz
         UtrfW5yZx8px/do6yH0PrzQcLuhUmF4raAMos8iAgjCw5kxyy8H4FB9psj2ubpEmzOnT
         tbTizq4lqdqu37oVmf1QhnJ7/vmDgjNAr/9XX3eQNrHapkhFu1Arz/f/3n7FvfSYdVbd
         gLgQ==
X-Gm-Message-State: APjAAAWrgkRPVu02txCQvpI87BW34I1rTpfBLSX51AbX7DCjjBtQpYW/
        l/UrZVIoMabvn2Qddde0bw==
X-Google-Smtp-Source: APXvYqzRLGQ2rrHTbYhxu1DTsUYfWDyIMzhjaBhm+avNIL/JcLPbhVGSpD0a7OXYgNdu3nuGiINX/w==
X-Received: by 2002:a9d:378a:: with SMTP id x10mr16253997otb.222.1569885135819;
        Mon, 30 Sep 2019 16:12:15 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q124sm4626835oia.5.2019.09.30.16.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2019 16:12:15 -0700 (PDT)
Date:   Mon, 30 Sep 2019 18:12:14 -0500
From:   Rob Herring <robh@kernel.org>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     robh+dt@kernel.org, andriy.shevchenko@linux.intel.com,
        dmitry.torokhov@gmail.com, bparrot@ti.com,
        andy.shevchenko@gmail.com, simon.budig@kernelconcepts.de,
        hdegoede@redhat.com, fcooper@ti.com, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 5/6] dt-bindings: Input: edt-ft5x06 - add vdd supply
 documentation
Message-ID: <20190930231214.GA6748@bogus>
References: <20190917155808.27818-1-m.felsch@pengutronix.de>
 <20190917155808.27818-6-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190917155808.27818-6-m.felsch@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 17 Sep 2019 17:58:07 +0200, Marco Felsch wrote:
> Add DT documentation for the optional regulator.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  .../devicetree/bindings/input/touchscreen/edt-ft5x06.txt         | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
