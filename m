Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FF77345620
	for <lists+linux-input@lfdr.de>; Tue, 23 Mar 2021 04:17:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229692AbhCWDQz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 22 Mar 2021 23:16:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230034AbhCWDQ1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 22 Mar 2021 23:16:27 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5577C061574;
        Mon, 22 Mar 2021 20:16:26 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id ot17-20020a17090b3b51b0290109c9ac3c34so9284981pjb.4;
        Mon, 22 Mar 2021 20:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hb9ppy/2Xid9gW7VtyfhfvgmVC3xm5wuAMLNm3/uELY=;
        b=TEa8adPoHx5ISnOF1pkcUaRMFa0MuJU+waBWp9tdMPPB0zh7zzDv6xlKyicyzYAY5w
         7qMsjfHCciXdPbcBtFlM+n5UN9WxNpbs4aoKN9/HQixeQBorLh/x2q8WaSKViILwTMvh
         CuI+cA2FCq8jbM7WzJZ7yhkMnu+SPrnsvU7rLiQd+o4oZEktl7I92EFyefTArl923RAj
         MHR1zVS4XiA87ZvTnSWDcQWpQQejgCsWTFvBG/sJKijbKJlc8txOXkn+6qNl1R77kIG/
         qRi87bYzODrY4EnDtCgeFVqrzLJ/uFPggMyLwgKHP1efZ9SViMFPmNi+K374vKQGBTCY
         b3Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hb9ppy/2Xid9gW7VtyfhfvgmVC3xm5wuAMLNm3/uELY=;
        b=PjYC9bidT7KBzW/e5E1CA/MKXX3nzkWkYm3Z6ShpVI+u9WmM8vZ/GCyvS9LKHovOsK
         iAQ18LtC9PrKVUzCklaWWW8nd6PNqjgutdgphQjxO2znCQARusMS2ZewU3kUxUPyzdSW
         PA+TkPM2TIz2rzoLdqOIbn1HGsQX5oLUboIijwO0tqFAvxjHjdTwpKaeVKa2Sg8zO2Kw
         589P6nBRlLZa4MKJrh0hhhGzdouxUo7iYNdA2psNi5/UTPkDQFwSnuN2LZAdutwu5WC0
         zY8m+rr349W0Jtx5I6MWFsPI2RxDvGmb8qVNAkJcA0fobt5ubLnyEhfI1PYfP9C4tRsg
         o7vA==
X-Gm-Message-State: AOAM533kEtGPXoPAFe63s83e54OT2ndb42H8FhjhsCef6kyTJg+ufWTF
        wxV8g2AHz3TSOPbOkF0LUB8=
X-Google-Smtp-Source: ABdhPJzQe4OJMXwB8Aq6k4DRvbxOz/7vPzM48VqcGu3n9YhIFkt5VHIxvH/8LoL8aP8nq88M4vimWA==
X-Received: by 2002:a17:90a:1509:: with SMTP id l9mr2231024pja.163.1616469386277;
        Mon, 22 Mar 2021 20:16:26 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:499f:7361:582b:fd05])
        by smtp.gmail.com with ESMTPSA id h68sm4841433pfe.111.2021.03.22.20.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 20:16:25 -0700 (PDT)
Date:   Mon, 22 Mar 2021 20:16:23 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     robh+dt@kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/2] Input: iqs5xx - make reset GPIO optional
Message-ID: <YFldhzhYiuqLKdNq@google.com>
References: <20210323021006.367-1-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210323021006.367-1-jeff@labundy.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Mar 22, 2021 at 09:10:05PM -0500, Jeff LaBundy wrote:
> The device's hardware reset pin is only required if the platform
> must be able to update the device's firmware.
> 
> As such, demote the reset GPIO to optional in support of devices
> that ship with pre-programmed firmware and don't route the reset
> pin back to the SoC.
> 
> In that case, the 'fw_file' attribute is hidden because there is
> no way to open the bootloader. The logic is extended to the case
> in which the device does not advertise bootloader support in the
> first place.
> 
> Last but not least, remove the hardware reset performed at probe
> because there is no reason to reset the device manually. A power
> on reset function already ensures a clean reset at start-up.
> 
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>

Applied, thank you.

-- 
Dmitry
