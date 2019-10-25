Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8356E5567
	for <lists+linux-input@lfdr.de>; Fri, 25 Oct 2019 22:48:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726074AbfJYUsp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 25 Oct 2019 16:48:45 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:41207 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbfJYUso (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 25 Oct 2019 16:48:44 -0400
Received: by mail-pf1-f193.google.com with SMTP id q7so2366143pfh.8;
        Fri, 25 Oct 2019 13:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=MdpCrK6CHk9RaIYJNl7SmLN35pgtJyN8+9/hgHFqLKQ=;
        b=IoapcdrtD2ejegECqYohNWcYgxOKZEuhyBHDiAcZO79Ph/0UYvn7IxKCpOnQfePXDH
         mSN/fMH00dIY2pYC0yfCqSx3qTICGqHFrqrzUi8JvqJ2RMaVvU+t8J75NtCHJfl2UmlU
         biP1d8noouj9M7dHMdHe8z5cKp94B9hf2A2rXlVELLMzRqNsMdnw8y0/W/wSmE8NlhZ8
         Png4vdHBCigDCgToWQEczFCbSmLNbXX5r2T68rFIAVg1bokR/xTQ3Fqdv7UbO1RRSd6k
         FjvZNk0loJ4oiln4OmEwtV2SvJoEkHk/yo/s8qInCYj95QvBHBou1JmIn4T18HtDSZuu
         1HOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=MdpCrK6CHk9RaIYJNl7SmLN35pgtJyN8+9/hgHFqLKQ=;
        b=Ns1x8rud/bk+CWe7QqLdXAOcuX9kdsJgo08eDMDUKE4yHarQLZ+MqMh7fDeK0r109Z
         EQ+3cP0g28h5D/oZA7bRlnXVluRAYMdMVtl/ZAXL+1fsVM0DyKOOzSYLhlH1KxZHuGSG
         WrlZC9vq5/sCgN2q5cxSyFBaM3KkWOI4vb93W0FEbyv8CLoFS79ii84DbprtuQGVCyjk
         Q2cKQ8e/H8emsQ2YH6uFxvxUI0s3gwDqXXO4erhRnGIqY2xgMLOmJ10iHQHOzXMzW+O3
         J1IvOVPetLaDGQ8nix8Zghp7VBdjgg6Sxltw5pjBx64X7xlgGo4PMOijmU5/vU2K0RSE
         rsog==
X-Gm-Message-State: APjAAAVoRj04jFl8N5etc0+vd9j8xDhIB9yKsYOzMEeBC9uz+fHpNv1/
        OeEs1FjWY7hWaRcXViKYJvk=
X-Google-Smtp-Source: APXvYqzF1kWAJ9G9WNc1OIfESATEjeNZ2o1PmiIJqF8bqI972+lW6COjq/HxTYGiyiuGn7KZA6B2Tw==
X-Received: by 2002:a65:538c:: with SMTP id x12mr6679544pgq.289.1572036523879;
        Fri, 25 Oct 2019 13:48:43 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id z63sm5004640pgb.75.2019.10.25.13.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2019 13:48:43 -0700 (PDT)
Date:   Fri, 25 Oct 2019 13:48:41 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v5.4-rc4
Message-ID: <20191025204841.GA169639@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Linus,

Please pull from:

	git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus

to receive updates for the input subsystem. There is a fix for st1232
driver to properly report coordinates for 2nd and subsequent fingers
when more than one is on the surface.

Changelog:
---------

Dixit Parmar (1):
      Input: st1232 - fix reporting multitouch coordinates

Diffstat:
--------

 drivers/input/touchscreen/st1232.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

Thanks.


-- 
Dmitry
