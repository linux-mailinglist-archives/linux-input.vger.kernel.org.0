Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9C72E7EFD
	for <lists+linux-input@lfdr.de>; Tue, 29 Oct 2019 05:09:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726243AbfJ2EJk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 29 Oct 2019 00:09:40 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:33283 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725830AbfJ2EJk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 29 Oct 2019 00:09:40 -0400
Received: by mail-pf1-f193.google.com with SMTP id c184so8573904pfb.0;
        Mon, 28 Oct 2019 21:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=IvoM2eWpiqYm1TPcjOfOHitp5xuEj0gkRugCi8K3Djg=;
        b=arB2RctSY1mxcFWm+0FTKr97oFW87d+WaW+fHurjvRY0TL7FCFMtGwpI/SmgkW2QsR
         K8F0dJ8x2lLjl/zRJhQuNLfoHklh5vPZfsWOgo8752DUc5gok5aUFSIGEqHdDWGn6Uqr
         8GaeGfbAAn1QII0JFtS+EzfbPajDfgFO/syQdIr4ZUWWzMhDVAMjcUXVNWdkGBPOLK5N
         Gt6MFaZdD1foSe3hFdytQm5JiCIlTGyZEArsKi1oePRwGNv98dDcJSALdC/3P8b0fPG8
         6nQhB75o3Dc3NflvcIAk6YqZuLABlFaKED7f5VfmLfZ8Gu8/5VOS3dusg0QLHfxexLag
         3eaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=IvoM2eWpiqYm1TPcjOfOHitp5xuEj0gkRugCi8K3Djg=;
        b=Ydv/CrgujMjE9vhy6ul7LUN14Jonozkm3FBTu+dHahpEHmZLLK2Uw29JMXc3c+4414
         fGwVK7kyh7+ekIcCZhpI9OkVsJk3v5d0/XyEPSE0fvSC/t5hl92jYB2zLzi4P2mxMVu4
         3BsKZZCYKkqfW22xRnP83Gvp83J1m2dE5BypVTi9Xr4AdQI9V92whT92VOGocihRpKCO
         K4aWKWuxjeCRMpw/HTA5Am3MJjY9kYf7XDXLuJ3pg9PtC5Rne84F6LAatV0TD1XNhmUi
         G7cqPUNcsId2p7qx8eRAFueBnx87tm7/HBQg4X/ZVM2eBjW2QzXn8M1lsv6Wp3mHkvZX
         awJg==
X-Gm-Message-State: APjAAAWwzsBv8EGh8d9BybAjCdGSfv1uZNwg8Oo3fVtXwwN16c0gwNAD
        2PNd7xrSKBnaLIbeni0o0pl/K2Qx
X-Google-Smtp-Source: APXvYqw1bAKAzjKX7DWOZEPp2c0sjnuqtnYHBAHUUyRYVp/dgdTGHZMLZdlfwNujm4e4y5uvz3UDXA==
X-Received: by 2002:a62:4d04:: with SMTP id a4mr24610260pfb.71.1572322177975;
        Mon, 28 Oct 2019 21:09:37 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id i123sm14373079pfe.145.2019.10.28.21.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 21:09:36 -0700 (PDT)
Date:   Mon, 28 Oct 2019 21:09:33 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Matthias Fend <Matthias.Fend@wolfvision.net>
Cc:     Martin Kepplinger <martink@posteo.de>,
        Dixit Parmar <dixitparmar19@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/8] Face lift for st1232 touchscreen driver
Message-ID: <20191029040933.GC57214@dtor-ws>
References: <20191022195622.66976-1-dmitry.torokhov@gmail.com>
 <VI1PR08MB37588375F08EA4F692AE475D85660@VI1PR08MB3758.eurprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <VI1PR08MB37588375F08EA4F692AE475D85660@VI1PR08MB3758.eurprd08.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Oct 28, 2019 at 07:28:51AM +0000, Matthias Fend wrote:
> Hi Dmitry,
> 
> > -----Ursprüngliche Nachricht-----
> > Von: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > Gesendet: Dienstag, 22. Oktober 2019 21:56
> > An: Martin Kepplinger <martink@posteo.de>
> > Cc: Dixit Parmar <dixitparmar19@gmail.com>; Henrik Rydberg
> > <rydberg@bitmath.org>; Kuninori Morimoto
> > <kuninori.morimoto.gx@renesas.com>; Matthias Fend
> > <Matthias.Fend@wolfvision.net>; linux-input@vger.kernel.org; linux-
> > kernel@vger.kernel.org
> > Betreff: [PATCH 0/8] Face lift for st1232 touchscreen driver
> > 
> > This series cleans up the driver and switches it over to the slotted
> > multi-touch protocol (MT-B) that should reduce the traffic between kernel
> > and userspace.
> > 
> > Note that I do not have hardware, so I would appreciate if you could try
> > running it and tell me if it is broken or not.
> 
> Looks good. I tested the series from your st1232 branch [1] and could not see any regressions.
> Note that I my 'real' application only supports ONE finger. So, the other fingers are just tested with debug output.

Thank you for testing. I committed the patches.

-- 
Dmitry
