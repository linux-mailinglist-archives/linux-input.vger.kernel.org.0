Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 954DEE2371
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2019 21:53:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389613AbfJWTxW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 23 Oct 2019 15:53:22 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:38553 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727595AbfJWTxW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 23 Oct 2019 15:53:22 -0400
Received: by mail-ot1-f67.google.com with SMTP id e11so18512472otl.5;
        Wed, 23 Oct 2019 12:53:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1bIb+RhHgLSZwKiMBuvQz/18Qd3L0WZpmt5iJmhuqjw=;
        b=eu8tHZ3HJlDc7E29En7yGv2WS4n604uvUxNXrmAakIqeUXXTIbnCB2t8myKDdjodg6
         +WokREilB1v6xycuCHSkwjN52SCeeBlyDYfh7fqexSR6FKeKnTlGTi13UpZAurPzkVJm
         XKT+p/TiSIPKQnrhml2JVdNz+E0CmooD5eE4MiXV+ecJ8UT0liipP5o9xY/0S1vp/P97
         Pvlw1sxzb4TpJKECrhQVIjgvEjRfgU+S/KLzqtvszg3AICVVIEsHxyAfTw1UM3HNnh1m
         5ivwHnIdJwAjNR7SdZvu1BBp0AnlabffjFb3dZ7IOCa1G6ARakBpFM2n9phaPDVHXcYu
         BQgA==
X-Gm-Message-State: APjAAAUcqU/HNkjNkl0V0hAblQ1P06e8tk+XkJ6GHV9zq5/JmWzhbSdz
        Op3lsdp7fCD5Gv1F2pSljA==
X-Google-Smtp-Source: APXvYqzMJTxKQtDdYaOrIOYlkXx4zs3pmNNgWmOh0vZhU06j5HSXbfkCMjAwFl4fmnCVmqeRzwYC8A==
X-Received: by 2002:a9d:73c8:: with SMTP id m8mr8943097otk.75.1571860401263;
        Wed, 23 Oct 2019 12:53:21 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r14sm3661448otp.23.2019.10.23.12.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2019 12:53:19 -0700 (PDT)
Date:   Wed, 23 Oct 2019 14:53:19 -0500
From:   Rob Herring <robh@kernel.org>
To:     michael.srba@seznam.cz
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Michael Srba <Michael.Srba@seznam.cz>
Subject: Re: [PATCH 2/2] dt-bindings: input/touchscreen: add bindings for
 zinitix
Message-ID: <20191023195319.GA28804@bogus>
References: <20191012192739.10261-1-michael.srba@seznam.cz>
 <20191012192739.10261-2-michael.srba@seznam.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191012192739.10261-2-michael.srba@seznam.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 12 Oct 2019 21:27:39 +0200, michael.srba@seznam.cz wrote:
> From: Michael Srba <Michael.Srba@seznam.cz>
> 
> This patch adds dts bindings for the zinitix bt541 touchscreen.
> 
> Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
> ---
>  .../bindings/input/touchscreen/zinitix.txt    | 36 +++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |  2 ++
>  2 files changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/zinitix.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
