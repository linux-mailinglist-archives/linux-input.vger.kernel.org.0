Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C746D1B8206
	for <lists+linux-input@lfdr.de>; Sat, 25 Apr 2020 00:25:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726027AbgDXWZu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 24 Apr 2020 18:25:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726022AbgDXWZu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 24 Apr 2020 18:25:50 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 584E4C09B049
        for <linux-input@vger.kernel.org>; Fri, 24 Apr 2020 15:25:50 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id p8so5305911pgi.5
        for <linux-input@vger.kernel.org>; Fri, 24 Apr 2020 15:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=85C06mayqJ90pd3y/GKV+gmDjjawfSqCW3jnE0VrsGs=;
        b=L1Ln+FAb/fuUrgn772A7MwGU/fM3mxQTENTTwukp27sIfZhqfkapVYM77JEZUo0+SB
         0bf7hjYq5GNQimWgSxcgxbsG4dShAALNC/7PlQm0IEpECZXAp9trYOau0NLHFgSnvxDJ
         mRncJkgblE1TFRCKGR0MHzL3IEkI31lPebRuvgyUES3oKbJfcXFJEnom9lL7cRgzi4XE
         9hgbPXKhRRJfwf5yiRfR9Nd4SC5mem7zLkH3HG844pyBnuZ5ODwlooFm/MXObz09B66x
         FvKRZ26b/GTbyMtT2fQWxF/IVKpCObGnjbKTHtjw5BIl+3t+VR+q3h3mJx1sWpovMSnD
         WfNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=85C06mayqJ90pd3y/GKV+gmDjjawfSqCW3jnE0VrsGs=;
        b=asrM8E7wFvv3aSD8Vwl9hhGL4DNRZjR4OPUm4XcLRC+2qjyBHVtYZb1235rZ5/D1Ej
         0gEjNNAu9DhOGnyf+c7et8epW2lUt+4RnkEgi+gNQdc0Qz0W/U9BshtIpCcsY8UNCbN4
         8Me7FUeqQBPzFMCzMOdUtDcjgFRm4uA5iPMagdk0KNEylTgO8vPYlsdzEPUhVbY1kJq+
         XrZ5jNzi6dAZ1fhEw54ejEYYLHyuHW+imljtFuZiLJXaRghc77TzcJ/PIo5KtDwEopGc
         atdPBpmVekgSnA03nuH8PDJq94DBcnKypgjPqOWGxalnfLA/1+DkfcO/TDmQF5yPC0U5
         mIlw==
X-Gm-Message-State: AGi0PuYz/y1g63iwSWckjHYmM7eo7TYDMnd/noplbDYmKt0EOC1TLbIJ
        lDBwe5R7b941y/b0l/BhVjI=
X-Google-Smtp-Source: APiQypLdw3D0o0GH2JPNlHljGuUrQjdbDcohLh5w9FL7fYA77eJam+GPLBSGYetIlXD/uqnHwM+eNA==
X-Received: by 2002:a62:8303:: with SMTP id h3mr103311pfe.206.1587767149513;
        Fri, 24 Apr 2020 15:25:49 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id g184sm6703975pfb.80.2020.04.24.15.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 15:25:48 -0700 (PDT)
Date:   Fri, 24 Apr 2020 15:25:46 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     <denk@eclipso.email>
Cc:     linux-input@vger.kernel.org
Subject: Re: Add a second working PNP_ID for a T470s
Message-ID: <20200424222546.GK125362@dtor-ws>
References: <ff770543cd53ae818363c0fe86477965@mail.eclipso.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff770543cd53ae818363c0fe86477965@mail.eclipso.de>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dennis,

On Mon, Mar 30, 2020 at 06:21:47PM +0200,   wrote:
> The Lenovo Thinkpad T470s I own has a different touchpad with
> "LEN007a" instead of the already included PNP ID "LEN006c". However,
> my touchpad seems to work well without any problems using RMI. So this
> patch adds the other PNP ID.

So there are no visible issues when running the touchpad in PS/2 mode
compared to RMI4? (Just trying to figure out if it needs to go into
stable releases).

Do you know what trackpoint does the device have? 

Thanks.

-- 
Dmitry
