Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1F0026959C
	for <lists+linux-input@lfdr.de>; Mon, 14 Sep 2020 21:25:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725997AbgINTZi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Sep 2020 15:25:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725951AbgINTZh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Sep 2020 15:25:37 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5981DC06174A;
        Mon, 14 Sep 2020 12:25:37 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id z19so420117pfn.8;
        Mon, 14 Sep 2020 12:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sbo0PRQlSXWTxAedykf/QP5e1+PDywWv9pdPAmGSh1A=;
        b=meJ4Uh5zkA3wOy6bVjqeD97oBBMvG5lUTlMnutyxFvPjsezYuGysK3Phk7HeOypTgY
         Pv6W/BIi714lMqswSfYbTLy6zvzd5zykxwnTvlbVn9Mw82gQILw80WR/t/lJMFcGqfly
         iUZ4/E3o1EZea53P0F2PRoI96wK1ZP+idihCsrjBUeehIa6GcLeRQGQMcVOCmH+05Dbj
         eLBLSxfYTtKwLiQ8owr/pnzVXtADt5qjxGWGepZ7B+OUwH9cOr/u1AKSv4bl8vtgsHCV
         kwfRcBaz4PEiNUfIildxUogmHbxbvfgJTJhM0zUQ+rNTiowqvp5bnNLBlzcWX76rb3wL
         Ep/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sbo0PRQlSXWTxAedykf/QP5e1+PDywWv9pdPAmGSh1A=;
        b=KMbvKY8TNdLMh40Bpxhgvv/tQ3lylTi9Zfca4B9ALeNfvh0ndgwt4PkIX8ZT2kI3XD
         QPKngb0LQ029FRa0DsQoh+dJ/ZM1tAi/B2N2X8T9YsASPdeeyJuqbXZJfaWGZARudDbF
         s09dO1vVEvP0zOHUAVYq2LQWN9GlQnE5EK7uQCEDzKg+TgeOq3CKbpPWeppJ2/qjd4nl
         Nw1KoJ1RtyRQ/NCReFITPvZoWRykzV3aA+uuOrMBbvu6YgHH2toVXD7UmmYTWdZXlBYp
         M4N9zidUR5k4mA1dA23r/NRJMcOL2CL7cNhhuC1o9HVWQHdgKrZ6w7SjoALnX/Aptqip
         kzIA==
X-Gm-Message-State: AOAM530ZhjBT4nWmLbxaUoW4MuBJhIqTFIthHvpv3K/GhTs9hnuSn9YK
        M8jNJcDlM3f3y2SP7SfcM5A=
X-Google-Smtp-Source: ABdhPJxBdwj9DZGYlG94Ky7T1bx2i0Q4j/7NwTN8jMlNLcizKJML/T0jhQCic5wkKtO3Z+wX3McQbA==
X-Received: by 2002:a63:d115:: with SMTP id k21mr11757203pgg.272.1600111536779;
        Mon, 14 Sep 2020 12:25:36 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id kt18sm10075354pjb.56.2020.09.14.12.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 12:25:36 -0700 (PDT)
Date:   Mon, 14 Sep 2020 12:25:34 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Vincent Huang <vincent.huang@tw.synaptics.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andrew Duggan <aduggan@synaptics.com>
Subject: Re: [PATCH v2] Input: trackpoint - add new trackpoint variant IDs
Message-ID: <20200914192534.GU1665100@dtor-ws>
References: <20200914120327.2592-1-vincent.huang@tw.synaptics.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200914120327.2592-1-vincent.huang@tw.synaptics.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Sep 14, 2020 at 08:03:27PM +0800, Vincent Huang wrote:
> Add trackpoint variant IDs to allow supported control on Synaptics
> trackpoints
> 
> Signed-off-by: Vincent Huang <vincent.huang@tw.synaptics.com>

Applied, thank you.

-- 
Dmitry
