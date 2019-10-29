Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F424E7F18
	for <lists+linux-input@lfdr.de>; Tue, 29 Oct 2019 05:19:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728085AbfJ2ETv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 29 Oct 2019 00:19:51 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:36439 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727937AbfJ2ETv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 29 Oct 2019 00:19:51 -0400
Received: by mail-pf1-f194.google.com with SMTP id v19so8585723pfm.3;
        Mon, 28 Oct 2019 21:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=IISBeLNeT95RVt2ARHBFfosSsx+IkNeJ1T361xgNmbA=;
        b=AsTUuHJ6KQ7lAuKbF+/RM2US5vdRCUn/Hvzkps/QCH0hNCGoljCQczvkAGgaef55t2
         lDpKX2fxamELCa8iEZMOQk/fyykLUMaeUUSoX/Yy3gGq+P/ie1eusJHEDuOtqxMXnCQm
         kXHh5SJ0Lw0j7BCOZVXsi+ojOEOvvkmv9KAvT9A029OLHJe6yLIf4uNklJNrR5cdmQKm
         Ya+kEnqDxHuiBGHODwuRy6wd+r6pQwbcv6FgsK98G5nU/PBIjI0Uhcy8z30D9w8gHbGq
         +XKOKP44IqPdzBa50WxpxhIrem2w9gEn7HE753n+byCvZW5IzWBPw1nso95s9p+t3iy2
         bmBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=IISBeLNeT95RVt2ARHBFfosSsx+IkNeJ1T361xgNmbA=;
        b=BIzUxvPhz60hS8fTmqYTf7LMx40EDCDawseR9PN4iEkuancgNXGpJWsOVIePNWj6Zh
         0PsPN7gUZp/ZoOyw/yrWyLxo/uojfNfLA2vfh/QVKXiu4nAp30MteNyfwQdAMOuxEyCB
         plJvcM2BA89JUj/s6lBKIcWcMxXX+Z7744SfIOAhFjiWgBR3BAOnh2gpiaLUn7i72C87
         JpA3r+vbztOT0TBsVjxcH6sOQI2Iju6cRWAHcrzRL7PekojIoOjzZhiSUHnSEQ8WUR6A
         uFRn9/X1yFsTKFAJ+K3KRrl3O+o35i4LdeDj2bETtNJBP13jr41MKzBvW23PUlOVP04Y
         tCIg==
X-Gm-Message-State: APjAAAXNrzoGfdEl2GZQkx2cNVDDrGskYvFv22mE+JWQoN48k0QcrQMq
        4IDvGM9GG5SLZdJeBe2bz9o=
X-Google-Smtp-Source: APXvYqyFdCfprsdXPggG+7jvCGO00bFYuq6dXu+pjOtG8atIUDs7g3j2AkjFHH94aU6ZgoYLtZl/Fw==
X-Received: by 2002:a17:90a:eb11:: with SMTP id j17mr3564315pjz.77.1572322790372;
        Mon, 28 Oct 2019 21:19:50 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id y8sm12640289pgs.34.2019.10.28.21.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 21:19:49 -0700 (PDT)
Date:   Mon, 28 Oct 2019 21:19:47 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Andrew Duggan <aduggan@synaptics.com>
Cc:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Federico Cerutti <federico@ceres-c.it>,
        Christopher Heiny <Cheiny@synaptics.com>
Subject: Re: [PATCH] Input: synaptics-rmi4 - validate that the rmi_dev
 pointer is set before dereferencing it
Message-ID: <20191029041947.GG57214@dtor-ws>
References: <20191023012344.20998-1-aduggan@synaptics.com>
 <20191023012344.20998-2-aduggan@synaptics.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191023012344.20998-2-aduggan@synaptics.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Andrew,

On Wed, Oct 23, 2019 at 01:24:05AM +0000, Andrew Duggan wrote:
> A bug in hid-rmi was causing rmi_unregister_transport_device() to be
> called even if the call to rmi_register_transport_device() failed to
> allocate the rmi device. A patch has been submitted to fix the issue in
> hid-rmi. This patch will ensure that should a simialr situation
> occur then the rmi driver will not dereference a NULL pointer.

This looks like "garbage in, garbage out" problem where we should not be
calling unregister in the first place. I'd rather not apply this.

Thanks.

-- 
Dmitry
