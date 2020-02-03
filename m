Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D15981505B1
	for <lists+linux-input@lfdr.de>; Mon,  3 Feb 2020 12:54:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727368AbgBCLyg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 3 Feb 2020 06:54:36 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:43983 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727279AbgBCLyg (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 3 Feb 2020 06:54:36 -0500
Received: by mail-wr1-f65.google.com with SMTP id z9so5446483wrs.10;
        Mon, 03 Feb 2020 03:54:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dRv+Glzb7YNCRUHcQDHRgXi+X7qrYn+IMNhPTFPhNok=;
        b=lC4h6BP5xSi2b3c7vmNTCS9UNEhl9qx4eRkEjESk7Ua1TDp8cUDJJ3uuGzs2uau1NQ
         hmvX6wl0v+U5Ye8FpP8MXc1XJ1KMnujdI+wFjoE+rbE3YVCXb4AhNaqE12DD7tgGs69x
         Nk3yKYvrt8Vix8WBHULiGUT8aiEVPnDrffU1L/WUqVxx1UZZc+ZQ8b6AfSXVLsEt9XIy
         ryCPkRnwu0nk1XLxGIq58vGEZt4r7js+MUMOSXNgvC6UdTJxjj2O52JE9Ie5anHXvxvo
         VXwoD2MMTSoJ3MjlIvxRUyS2LNWfCmOZYOZIiRlITgZrqwjJgnKNgRp1Z3/VKN3Asu8o
         ++UA==
X-Gm-Message-State: APjAAAVlS48jYzbJG7PrMat+Y8xAiowTLnnXe+bXOgCg+e/nYf6PKaLB
        Z7K1DMQeHRLIGbwZZKR/4A==
X-Google-Smtp-Source: APXvYqxEaLT/+T3yQRKjCVVu81i90WTdhDwAiAh3KPMmX6RLYtXBfSJ/UNESs62P4MSsWkXhkLYAhw==
X-Received: by 2002:a5d:66cc:: with SMTP id k12mr14770332wrw.72.1580730873248;
        Mon, 03 Feb 2020 03:54:33 -0800 (PST)
Received: from rob-hp-laptop ([212.187.182.163])
        by smtp.gmail.com with ESMTPSA id t12sm17558039wrq.97.2020.02.03.03.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 03:54:32 -0800 (PST)
Received: (nullmailer pid 9221 invoked by uid 1000);
        Mon, 03 Feb 2020 11:54:32 -0000
Date:   Mon, 3 Feb 2020 11:54:32 +0000
From:   Rob Herring <robh@kernel.org>
To:     Nick Reitemeyer <nick.reitemeyer@web.de>
Cc:     dmitry.torokhov@gmail.com, robh+dt@kernel.org, stephan@gerhold.net,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Nick Reitemeyer <nick.reitemeyer@web.de>
Subject: Re: [PATCH 2/3] dt-bindings: input: add Coreriver TC360 binding
Message-ID: <20200203115432.GA9189@bogus>
References: <20200121141525.3404-1-nick.reitemeyer@web.de>
 <20200121141525.3404-2-nick.reitemeyer@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200121141525.3404-2-nick.reitemeyer@web.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 21 Jan 2020 15:15:25 +0100, Nick Reitemeyer wrote:
> 
> Signed-off-by: Nick Reitemeyer <nick.reitemeyer@web.de>
> ---
>  Documentation/devicetree/bindings/input/cypress,tm2-touchkey.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
