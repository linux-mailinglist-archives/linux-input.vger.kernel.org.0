Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A0B1E55BD
	for <lists+linux-input@lfdr.de>; Fri, 25 Oct 2019 23:18:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725811AbfJYVSC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 25 Oct 2019 17:18:02 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:34928 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbfJYVSB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 25 Oct 2019 17:18:01 -0400
Received: by mail-pg1-f196.google.com with SMTP id c8so2359214pgb.2
        for <linux-input@vger.kernel.org>; Fri, 25 Oct 2019 14:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=TM/SLZ1KgBcRGRw095P4EAfILp7FQAa6pFdS1rVxB0k=;
        b=JC5Cm9f1+xUHZzWkaORDxHwBl3jMX2UMx68ac94vAimDiFf5in4zMjeRQZdzFj/ACX
         KnlJw983bcvxCuGF80iNTUQ0FXNNFt+xZeJUCqA5go+1H75oBz4nSMO9mGFPRzWZtl/w
         P6jfyG9m4yRTq9/NIXZvO1yxYohrLvAxml1F0/wxxY5/z8HhJiiNfXoILao3CPH5qRa4
         jAlw8na+sKHnI4r1FUD8EGvoFi74CLFy4xhKTpFXh39S3RiIQd9gdnukHiExzFXdqt1y
         9PtCtW3jMmY/LNcHFWW6Mgru8iOdlT/V9sCg7xDjk6SYj0bKLndF+NEc9dAUqp8XbmSF
         zc0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TM/SLZ1KgBcRGRw095P4EAfILp7FQAa6pFdS1rVxB0k=;
        b=uFXlDrXR9SUmJ+KBqmI/G59GvxpKMEm5ZdXAELzxAvq/nJ6ZY+IifARpvg9T0on3UD
         jF/10emDSMb8KQ00pxjSrsDaXFuSn7L14KyU9+AEg2rj0TTOQDI34IH6w34urT+qCJop
         VQqolIeaKJ1B/AsMXpMU7zn/gLqHMwHX9NIl3yviYu3Qr4dXfBCw6tKquZxrJqRFp6Ld
         jX0T/Bje+0iDl0J/xQafcX4GOZt74syrzqW9DbIaAV9nBpEhy7jGzIuXRGQJuodLplAn
         PHjxpSkkS9zkqwPqlF/bm/qybS65gtKqdZLrG4B73CKtPyA0tZGTeYK8GhGzY06DQdFr
         NW1A==
X-Gm-Message-State: APjAAAUxeOZkCCXh4VPLKtzOxlSJVYhgW2//mv0LvELJD+rlKDeynZ1J
        ovXaosfVjR1M10+J70atZqU=
X-Google-Smtp-Source: APXvYqzi8ihFoecGuB3PPlwzS3gOnVydAfE54HxZI3z5rj7iHlGmI35qiXs4nQUcZBpxT24j2cqiYQ==
X-Received: by 2002:a63:5417:: with SMTP id i23mr7018630pgb.305.1572038280882;
        Fri, 25 Oct 2019 14:18:00 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id m34sm3602283pgb.26.2019.10.25.14.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2019 14:18:00 -0700 (PDT)
Date:   Fri, 25 Oct 2019 14:17:58 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Saiyam Doshi <saiyamdoshi.in@gmail.com>
Cc:     robh@kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH] input: touchscreen: Add NULL pointer check before
 dereference
Message-ID: <20191025211758.GC163068@dtor-ws>
References: <20190901182309.GA5574@ahmlpt0706>
 <20191024180822.GA6408@SD>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191024180822.GA6408@SD>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Saiyam,

On Thu, Oct 24, 2019 at 11:38:22PM +0530, Saiyam Doshi wrote:
> On Sun, Sep 01, 2019 at 11:53:09PM +0530, Saiyam Doshi wrote:
> > In sx8654_probe function, if call to device_get_match_data()
> > return NULL, it dereferences driver_data from 'id'.
> > 
> > To avoid NULL pointer dereference, add check to make sure
> > 'id' is not NULL.
> 
> Any review / update on this?

Can you please explain under what circumstances we can get NULL from
device_get_match_data() in this driver?

Thanks.

-- 
Dmitry
