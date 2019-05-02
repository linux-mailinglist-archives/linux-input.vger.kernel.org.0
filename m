Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9920A12427
	for <lists+linux-input@lfdr.de>; Thu,  2 May 2019 23:32:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726053AbfEBVcU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 2 May 2019 17:32:20 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:36964 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725962AbfEBVcT (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 2 May 2019 17:32:19 -0400
Received: by mail-ot1-f67.google.com with SMTP id r20so3518306otg.4;
        Thu, 02 May 2019 14:32:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=orS40jFtqb35Wbp7JodVtiOmNi03+OR+s9mWL3M/pTo=;
        b=D/JCcWotYNLyZKfL2bzhRp1xd6g+p2AZ7Qsxcwf/EK6f6BfP7MgsEN5kdnRPGl1+v0
         WK2PTt2azvJe4QZyaI0B532X+X3/Q3pAjhPJyVXpMg93h9Nu9EaxtbMVAZqegXnrdw4v
         tH4rElbYTNkNHY6EMf4V4NOBxRFPdf5nbNKh3GeMNFOtnuQYpNjYJHuElSHilbbOTu8D
         z/fk+L8hVSUQ+YhEmOUH9siiP0rl8gBKwfIXjeMB1adJutHd25MAJENMEywKQ7W+jNLV
         UStCysll/cZxYwmq0r58DI4amO9onvgZktW6nCQkLbmkM/Au+zfDbKNCD06G+uNLwu7P
         vJJQ==
X-Gm-Message-State: APjAAAWRwCoGnqfEneRb8zAGp7bOvEBUUjy+CtG8IJjycTwGeNY1YjaH
        y6rpZbM19iFHbr1P2CSBBQ==
X-Google-Smtp-Source: APXvYqycgFFoT6XyDRCj95MK86JH5d0iSJKNsTW2unTnGgy0mZGyLggORq55HQkw5az2wxF69nEyYQ==
X-Received: by 2002:a9d:66a:: with SMTP id 97mr4150543otn.234.1556832739089;
        Thu, 02 May 2019 14:32:19 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 38sm92068otg.10.2019.05.02.14.32.17
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 May 2019 14:32:17 -0700 (PDT)
Date:   Thu, 2 May 2019 16:32:17 -0500
From:   Rob Herring <robh@kernel.org>
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc:     linux-kernel@vger.kernel.org,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] Input: edt-ft5x06 - add support for polled
 configuration
Message-ID: <20190502213217.GA14901@bogus>
References: <20190430185859.24015-1-nsaenzjulienne@suse.de>
 <20190430185859.24015-2-nsaenzjulienne@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190430185859.24015-2-nsaenzjulienne@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 30 Apr 2019 20:58:59 +0200, Nicolas Saenz Julienne wrote:
> Some devices might not provide an interrupt line for the touchscreen.
> In that case the driver defaults to using a polled interface.
> 
> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> ---
>  .../devicetree/bindings/input/touchscreen/edt-ft5x06.txt  | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
