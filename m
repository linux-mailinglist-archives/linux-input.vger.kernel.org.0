Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDE5B282EF2
	for <lists+linux-input@lfdr.de>; Mon,  5 Oct 2020 04:50:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725845AbgJECue (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 4 Oct 2020 22:50:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725841AbgJECue (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 4 Oct 2020 22:50:34 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D840C0613CE
        for <linux-input@vger.kernel.org>; Sun,  4 Oct 2020 19:50:32 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id az3so1407518pjb.4
        for <linux-input@vger.kernel.org>; Sun, 04 Oct 2020 19:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8F+GD5DAbFuzwe2JGAFNHFHZTFKAdUWRIvZ2Fe471cA=;
        b=mZEj8g+7qjCIoDx9HyLdDtyvRCEvn2nZHR2pVpufIq/xa4lubaFNAR86Rzwh/iWuAM
         ZazieFnuWMzX9yR/pC8PJJr7VfThJ6DRQujLk/7cRDJuIpI+Z0Irula2EyNzvT3B77Gn
         dD+5lEmYRGfvcrXCpyJxUK7qPLaxNz/UBEvObc5vE/nkmUwNeqAWkpPVAo2Osci2/RKv
         EqEqRWRZ3VXSRn8jR9KbOFmo+pEAEl0pzSNgWPaIqcPoZsrbM4vLlxYfHK5yJOi8jQtG
         quspz2eAnxS5IfGSrspRXd5gJ48iJ9Q2Ds19k38QA8kDAPvF/wGH8z73/9fOI4CyPJZ3
         KeNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8F+GD5DAbFuzwe2JGAFNHFHZTFKAdUWRIvZ2Fe471cA=;
        b=IMhGd0Z6sP/F571kKyMmL7umQYaECQxpSmTxDE7HtG4TIhjVHZgkrhlMx9rXhhZbeX
         U0EupYhg6fMknsze6FOdz/tXO1pBEELdz6h6Wtr/OVa/Ml91GFw8XSLu9+WLKj/pG/lp
         Gdjf1SXdJnuOTp5PeXyYIJm2bCuzbr3UA02O/H1G/8tkCm1S8jyhW1BHZDraL3UsRWRb
         G2/buqNm9cSIV6u0gcd/gWnZAn3BztFLz7C8hKQyNZlTGdxTK6GI5WHrsaFM3pcKD5W5
         odc7nlOiDVmJrcSzbuawrZGqTC5QLXjytcHVjkjQqL9py9rZXQiljW3rrNvouhPhFNIL
         NUHQ==
X-Gm-Message-State: AOAM5303fBfs5ol6aYQSDkPF96eCgKI+aOLZD8XsREUyBpFdUjVvBCBK
        v8ldu2w6DyvJCBSgHogvtp8=
X-Google-Smtp-Source: ABdhPJxxr0wBNxYbfYvFIa1WokZ+V/St8sQpPbu34zemDvDTnk6yIGpELOSQssmBBjF0IkFxEkR5CQ==
X-Received: by 2002:a17:90a:9912:: with SMTP id b18mr15320882pjp.192.1601866231769;
        Sun, 04 Oct 2020 19:50:31 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id 36sm9120213pgl.72.2020.10.04.19.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2020 19:50:31 -0700 (PDT)
Date:   Sun, 4 Oct 2020 19:50:29 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     linux-input@vger.kernel.org,
        Vincent Huang <vincent.huang@tw.synaptics.com>,
        Lyude Paul <lyude@redhat.com>, Jiri Kosina <jikos@kernel.org>,
        Andrew Duggan <aduggan@synaptics.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Benjamin Tissoires <btissoir@redhat.com>,
        Chris Heiny <chris.heiny@synaptics.com>
Subject: Re: [PATCH v3 1/2] Input: synaptics-rmi4 - support bootloader v8 in
 f34v7
Message-ID: <20201005025029.GD1009802@dtor-ws>
References: <5bd2bb9d925cfc81392bd9bf93b31ce4fd81e107.camel@redhat.com>
 <20200930225046.173190-1-Jason@zx2c4.com>
 <20200930225046.173190-2-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200930225046.173190-2-Jason@zx2c4.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Oct 01, 2020 at 12:50:45AM +0200, Jason A. Donenfeld wrote:
> With the recent addition of the F3A support, we can now accept
> bootloader v8, which will help support recent Thinkpads.
> 
> Acked-by: Lyude Paul <lyude@redhat.com>
> Cc: Vincent Huang <vincent.huang@tw.synaptics.com>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

Applied, thank you.

-- 
Dmitry
