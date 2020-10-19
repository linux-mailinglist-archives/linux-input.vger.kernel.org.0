Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BAB7292B09
	for <lists+linux-input@lfdr.de>; Mon, 19 Oct 2020 18:04:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730471AbgJSQEp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 19 Oct 2020 12:04:45 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40594 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730325AbgJSQEo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 19 Oct 2020 12:04:44 -0400
Received: by mail-wr1-f65.google.com with SMTP id h5so325016wrv.7;
        Mon, 19 Oct 2020 09:04:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ABuAwC5gyWGAC6nFSoKhzJq+IS73ETEJyl1t5goVU2Y=;
        b=fKhB0VTD8ZlKDfqwpGiJ2466XFA7dRGgFaWJJziEMfrnZXDmmFeq++NNaqbsxLiIR8
         Ust8oENULmKlxR8ig21DfXrhn9bKfwKW/Uhz370d51hiV/+q356njomG84GCxdMwTVoa
         TFdKCP3hedXGsZPQhzOG65wyrGYVAZHNc98cyWm3yNjrob97FGug7gkBYR7kl6wvjrPZ
         eZpZZvwmvMfpBa/tqzWn8ZpYRCYK/ZGKn65DBfgFp7LwEWy2unkJIJyQ5f1ve1aClFvD
         hdMPc5xNypfLOw8LL6WgHxB4aHGt4xJKMhg/bn4y1WQ+lQ3dkmamAIU7AceJXZr0v6Qh
         Wt2A==
X-Gm-Message-State: AOAM5334PCJvbWNUU+HYkpl6a95jYSuNnOG/MKgfrgC6XuguDyxMjpRw
        KU2gyFfLZNyPeY8ClOqjJ0Q=
X-Google-Smtp-Source: ABdhPJx6FSpYaz6boMsF+fSjU5fdgIm883DrBbsIjECCxD/Vz1wl27Bu3JOKhsFe4AfyfGgX4779qg==
X-Received: by 2002:adf:b19c:: with SMTP id q28mr235060wra.119.1603123482642;
        Mon, 19 Oct 2020 09:04:42 -0700 (PDT)
Received: from kozik-lap ([194.230.155.171])
        by smtp.googlemail.com with ESMTPSA id i14sm27917wml.24.2020.10.19.09.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 09:04:41 -0700 (PDT)
Date:   Mon, 19 Oct 2020 18:04:38 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     kholk11@gmail.com
Cc:     dmitry.torokhov@gmail.com, robh+dt@kernel.org, rydberg@bitmath.org,
        priv.luk@gmail.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, marijns95@gmail.com,
        konradybcio@gmail.com, martin.botka1@gmail.com,
        phone-devel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: Add vendor prefix for Novatek
 Microelectronics Corp.
Message-ID: <20201019160438.GA34785@kozik-lap>
References: <20201017190152.12780-1-kholk11@gmail.com>
 <20201017190152.12780-2-kholk11@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201017190152.12780-2-kholk11@gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Oct 17, 2020 at 09:01:50PM +0200, kholk11@gmail.com wrote:
> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
> 
> Add prefix for Novatek Microelectronics Corp.
> 
> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)

You dropped here Rob's ack.  Once received, you need to add it on next
versions of your patchses (unless there are important changes).

Best regards,
Krzysztof
