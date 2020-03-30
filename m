Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD0D01987CF
	for <lists+linux-input@lfdr.de>; Tue, 31 Mar 2020 01:07:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729112AbgC3XHt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Mar 2020 19:07:49 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:46122 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729024AbgC3XHt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Mar 2020 19:07:49 -0400
Received: by mail-io1-f65.google.com with SMTP id i3so10566574ioo.13;
        Mon, 30 Mar 2020 16:07:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=chGQTsw5zTRQp9yO7WbnNWqcvQOzsJXAgi/QX2be7+4=;
        b=AjIls7hakKZtT1XDfOIxfTQbMWRX9c2Mcaaw/2H8Qj/aH1VNka4Bj6Rc1C305WBxlv
         YbMqASse3tftp7fAvTfJ9yeRqWgXjJpl8fWIFe7mWgggVs2ynUjrSXOII+A352bCHR//
         hVFnTLfGukoMK0ddLOsa29odrWCrzopT1wK9u5rjpJQ8dG80uibgCIvjXnNAZtPZ/SC1
         LzKUXDwcWhujcgXf9XbKp+r7FuJ0t3w0X4+ykiMHrjXr7zjMqpZU8hhofazkXrz35EIr
         O5QEBL/UDNII37vlTXonFrNqfU3ee0hrVf4TmmA+7GV22FyW1IGVc7Z+dnD3eoFyBmI9
         z7fg==
X-Gm-Message-State: ANhLgQ2i265/omkjLhGCs+yGKUtvUoIrrYOtjrzz55avHgS+eITPnzVv
        FvVWZDzn0/2Vtk7DRLk8CQ==
X-Google-Smtp-Source: ADFU+vvbgnzRmbGJ7skGR+whQLGxWd+3EUVi7PCGAwW680fWQDZcpYbcAe9KY5cRtfcgjILNQ+FEAQ==
X-Received: by 2002:a02:aa8a:: with SMTP id u10mr12752032jai.88.1585609668383;
        Mon, 30 Mar 2020 16:07:48 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id e3sm4364026iob.36.2020.03.30.16.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2020 16:07:47 -0700 (PDT)
Received: (nullmailer pid 30747 invoked by uid 1000);
        Mon, 30 Mar 2020 23:07:46 -0000
Date:   Mon, 30 Mar 2020 17:07:46 -0600
From:   Rob Herring <robh@kernel.org>
To:     Lubomir Rintel <lkundrak@v3.sk>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
Subject: Re: [PATCH 1/2] dt-bindings: input: Add Dell Wyse 3020 Power Button
 binding
Message-ID: <20200330230746.GA30690@bogus>
References: <20200318114556.2064-1-lkundrak@v3.sk>
 <20200318114556.2064-2-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200318114556.2064-2-lkundrak@v3.sk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 18 Mar 2020 12:45:55 +0100, Lubomir Rintel wrote:
> Add binding document for the Dell Wyse 3020 a.k.a. "Ariel" Power Button.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> ---
>  .../bindings/input/ariel-pwrbutton.yaml       | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/ariel-pwrbutton.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
