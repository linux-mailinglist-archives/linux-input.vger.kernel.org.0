Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E7822AAF7F
	for <lists+linux-input@lfdr.de>; Mon,  9 Nov 2020 03:30:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728951AbgKICax (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 8 Nov 2020 21:30:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728191AbgKICaw (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 8 Nov 2020 21:30:52 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD0FFC0613CF;
        Sun,  8 Nov 2020 18:30:52 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id 10so6638360pfp.5;
        Sun, 08 Nov 2020 18:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=97bIU7Ah2zcwtrZDaMEPuJqyR/E3fSCE9P48D4HEInw=;
        b=OXq67GFCmG1/talB0nmpfziKihCuY+Rx5UFaYl8ks6HPFfyUwII3t5rebsXmMyi5Cc
         Vz0xr5M8wUzVCXNoGR0jlU+rEgnkCPZHLOe8e8fJLAIDxzIN4X84Z7C45Zsxd9kRFSxS
         hg63obb03f4c4hC75/D6ebzGzT+EJnqY7RT8v0tRWqEofBZz8+cAhxJ7GU+uozSSucDs
         2PufPZa5BzqBHDUQI7dnd7FxbzhZadtc1cql+h5pUbzq3FOCod564Hs1xGnvblc2D/47
         kZiOff+fStzW2uHj5Jijs6SzrF0cgvHdPK2liaLYZD6miz9KRwGft4Xd02zKhUEiWAW6
         VaXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=97bIU7Ah2zcwtrZDaMEPuJqyR/E3fSCE9P48D4HEInw=;
        b=U7mdcHlFInEHibGi5M1izQ2dWr5KARaKNhD+COlFJLjgqW40Q0t/Cj3B+MX+u3YGiK
         wC6Shn/nrDDhHB8DL20JPzdHHMC02rwq644vBwGHqR7mQJ9t6OwvGFpqSypCrxhti5mp
         bL33faoh8uU/G1/fB1UfEdN959cFNvJpByB4VjuyqnW98KAN5DOXdImQBYY1MQUqdmAx
         jfum3plPirzLC53q27RfOqUxsKiBu1zthS+QtelYXTAYkeqI/+ZJrqtD+rzEN8xdFmKe
         Iwk9W1fZgM3uzJTR+Vdtulsh3EHN94rkmDMtQyq7TlY5OCWNOG0B9f5BnEHfoyLQxzUF
         BcOw==
X-Gm-Message-State: AOAM532KCTh2BrJVsJiRxyTtzFVxFLc/eAbgKs4km5zGiK+VLOVaY9I7
        6V3sPgI6wZqHBE6B+S7Jf08=
X-Google-Smtp-Source: ABdhPJw4TTbCocNADRmWPfrAx64jfokiitVSBIIwLslLQex9yg1k+k9Q8M+HtulejHiRzXcpTjWQog==
X-Received: by 2002:a17:90a:1f0b:: with SMTP id u11mr10599804pja.105.1604889052272;
        Sun, 08 Nov 2020 18:30:52 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id s6sm9882963pfh.9.2020.11.08.18.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2020 18:30:51 -0800 (PST)
Date:   Sun, 8 Nov 2020 18:30:48 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Cc:     linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: input: ektf2127: Add elan,ektf2132
 compatible string
Message-ID: <20201109023048.GF1003057@dtor-ws>
References: <20201106112412.390724-1-j.neuschaefer@gmx.net>
 <20201106112412.390724-2-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201106112412.390724-2-j.neuschaefer@gmx.net>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Nov 06, 2020 at 12:24:10PM +0100, Jonathan Neuschäfer wrote:
> The eKTF2132 is a touchscreen controller found, for example, in the Kobo
> Aura ebook reader. It is similar to the ektf2127, but it uses a different
> packet type to report touch events.
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>

Applied, thank you.

-- 
Dmitry
