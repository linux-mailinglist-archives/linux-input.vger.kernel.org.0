Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6E7F29A669
	for <lists+linux-input@lfdr.de>; Tue, 27 Oct 2020 09:20:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2509021AbgJ0IUU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 27 Oct 2020 04:20:20 -0400
Received: from mail-ej1-f65.google.com ([209.85.218.65]:36622 "EHLO
        mail-ej1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2894590AbgJ0IUC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 27 Oct 2020 04:20:02 -0400
Received: by mail-ej1-f65.google.com with SMTP id w27so955962ejb.3;
        Tue, 27 Oct 2020 01:20:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tO5qsH1OWw10E78OhL3eoRQtmzTRnL6ZkVFi6MpMJoM=;
        b=XwXuheGT00h8aVYfSnGZFuU9/V242LP/msPOKwYCikPnWUriRUKxwy18hde868YtY5
         ONYv150muGhkUU+F/osSVKjjNziJhBZEcl3vagJeXZ3soIkDnUsdZKZ7GPRbyKZ0n3ld
         nBfk1zeqa+pRYLlU6cX4krlZSZyBvE3Hkmj39Pxf4C+DtcJM3wqZgiCdMF9DULSB/Swu
         Uh38t91g6qOnJEikLbxNt+Q+JzmE2WTOJGvobwINH/45ZjXfjuZxf9gouFzfLM05IWoR
         Fr2oXXTFTNaGN9QRze1DCMq12q/uj7UTZtwgkzrZgrR16ud7j/mj/jgK1EwTub9glNi7
         z88w==
X-Gm-Message-State: AOAM530N28CR+UrkLzH1xyy9D60yq95RQe1aaWZvIP7nUDLzIsaN2b3/
        1tFrIps5KKg4zbg325HAaOs=
X-Google-Smtp-Source: ABdhPJzrbiglGDTadhp1qyM361NkPCwGDqE2U+kX4jccCq1tqL3ugkBaUhUlDWkqkP6rTadd3QIdDw==
X-Received: by 2002:a17:906:5bc8:: with SMTP id w8mr1209774ejs.101.1603786800319;
        Tue, 27 Oct 2020 01:20:00 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
        by smtp.googlemail.com with ESMTPSA id h8sm442738eds.51.2020.10.27.01.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 01:19:59 -0700 (PDT)
Date:   Tue, 27 Oct 2020 09:19:57 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     kholk11@gmail.com
Cc:     dmitry.torokhov@gmail.com, robh+dt@kernel.org, rydberg@bitmath.org,
        priv.luk@gmail.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, marijns95@gmail.com,
        konradybcio@gmail.com, martin.botka1@gmail.com,
        phone-devel@vger.kernel.org, devicetree@vger.kernel.org,
        andy.shevchenko@gmail.com
Subject: Re: [PATCH v8 3/3] dt-bindings: touchscreen: Add binding for Novatek
 NT36xxx series driver
Message-ID: <20201027081957.GB4244@kozik-lap>
References: <20201026173045.165236-1-kholk11@gmail.com>
 <20201026173045.165236-4-kholk11@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201026173045.165236-4-kholk11@gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Oct 26, 2020 at 06:30:45PM +0100, kholk11@gmail.com wrote:
> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
> 
> Add binding for the Novatek NT36xxx series touchscreen driver.
> 
> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> ---
>  .../bindings/input/touchscreen/nt36xxx.yaml   | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/nt36xxx.yaml
> 

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
