Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5826B1D1C0D
	for <lists+linux-input@lfdr.de>; Wed, 13 May 2020 19:19:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732781AbgEMRTf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 13 May 2020 13:19:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732731AbgEMRTf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 13 May 2020 13:19:35 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41BB1C061A0C;
        Wed, 13 May 2020 10:19:35 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id 9so46547pgr.3;
        Wed, 13 May 2020 10:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1W5H6dGOEkGWBgNOPpkRvp5ErWI1HdVM+iv3UwbY6Ys=;
        b=ZPo8mjFHFU3+3LCg5UAPIyHuQKwBqAvlznyue+P9a3sjagqcfWfgq5eUmdbmUb28Nl
         iwCp2/OAg7DjV7rIwzvMxnUlRICFVRwYgczrc50GcyN+PQHPXFZlM8TMqhn5GjtmRCIc
         Ysr/M+TpSiupQ2UWw0+IIVVDcNsnXpxzxI6SMMjxkN3ou/6qG5eEFFEBfNPTcDOha/vq
         iPjdKoYrmkbD8347Ie1Wc/bkx714WZGMlPdx+MEsGGf2fH5ensA015poiwWOeuYXxnVq
         XCn5iFjl/18Re052CDgLIkEm2rOxcKVfE2YgbwYtFzdW+XDXfKHnZDY+OVojPX+SWzp/
         9J8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1W5H6dGOEkGWBgNOPpkRvp5ErWI1HdVM+iv3UwbY6Ys=;
        b=KYiHqObpYo5O4p7TR3a/tiZquQ6eQEVe1HZEhVsFBgdzQh4/CbIW38ia/ncSFgNF1e
         EDv/dHTrxHMkfg6IZriTkj9I3mhn5LqMFmgfghkRAtbTq41hgo1zyrB0/rxO4QjEljz3
         zPMPi60ZSeL/Myu3ioC+38M9gYhtFGQ4hRM3yJnH8tStq+Oo7ZfpD2f0TyHCWc/DbmeS
         BAv/rN+zAmaxluPa8k3S49ogZSHHsi3AkdjbUFfX3y2I0oJveZp/VMnaT4Epp2b/vQFQ
         maGzGTBQFod+e4wW5xDmJxmsASkjxdmdTYHVGee/50nFgHHCn3CRLpGgtQf5zV7qfas6
         3NYQ==
X-Gm-Message-State: AOAM533JR0OuKEdZTPLelgASpqNzKAZSArNz+9UnXkUGiE3ScmVUSZBd
        zCeFJ+OWwHBq3hj6mt8uuzA=
X-Google-Smtp-Source: ABdhPJyspRTVExTYGHoYQ89DRv24IY2ZZKDrfDihL5ZohDzGqWHfpJ354kTb6N/sqyXWpf7AZ4VCMw==
X-Received: by 2002:a63:b219:: with SMTP id x25mr363136pge.66.1589390374527;
        Wed, 13 May 2020 10:19:34 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id gz19sm15932422pjb.7.2020.05.13.10.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 10:19:33 -0700 (PDT)
Date:   Wed, 13 May 2020 10:19:31 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, robh@kernel.org, linux-input@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Linux-imx@nxp.com
Subject: Re: [PATCH] input: keyboard: imx_sc_key: Use
 devm_add_action_or_reset() to handle all cleanups
Message-ID: <20200513171931.GI89269@dtor-ws>
References: <1584082751-17047-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1584082751-17047-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Mar 13, 2020 at 02:59:11PM +0800, Anson Huang wrote:
> Use devm_add_action_or_reset() to handle all cleanups of failure in
> .probe and .remove, then .remove callback can be dropped.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Applied, thank you.

-- 
Dmitry
