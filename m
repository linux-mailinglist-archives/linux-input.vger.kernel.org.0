Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AF741D055C
	for <lists+linux-input@lfdr.de>; Wed, 13 May 2020 05:18:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728078AbgEMDS0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 May 2020 23:18:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725898AbgEMDSZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 May 2020 23:18:25 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62D89C061A0C;
        Tue, 12 May 2020 20:18:24 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id u35so4153282pgk.6;
        Tue, 12 May 2020 20:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cm9j0GOHhz5fwX/B7Rq6S2PO60WtEzSereULuu02L4c=;
        b=TQfzImz2Effkfi3tbUcWLOK3eNl9mEBZfCT+cWvWwwpsZVtN5UfDDULWpnhVVMjD7m
         +l1P7r1geTRM5hA3UG5rRph451DWBDcLGeBJFGIcpewv2uMChQ2ZcfdMuHVLzoBTw0de
         /Tg96xeCjiu9dqIqkmm3lVu8JdHjcEiEw/7KJXBlakYBOuidtFM1yeqoA1myrYgk5Bu0
         cYPiI9+ZxAgSI1xZCt7ba0RIMttr7UANItgwWTO9/PefxZx14pP9PNkoo+iP5EM9k76I
         0Ta/xTDOc7dKh3SCFBUlUZ0Rc51Ejt/SVPChuBzEjaeDkwo5aJPP75fiAEYXs/H9yHPK
         /blQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cm9j0GOHhz5fwX/B7Rq6S2PO60WtEzSereULuu02L4c=;
        b=ijZYqyVlDWqNd/XsLTGyjmo6e11Agg+xhHdlRqUGr4qJZVJZhn7KVWIiGrIQbmgMnI
         i8J4KqboE8KJq7E4swsHAduBWBEfMomq53gX8Sb2huqWFLEVYO5wByv1FeYpy4w12D5Z
         b7pajJ1Vl+zZkh/Kz1wqeyFeLhJUsuG/F9JMnz74jKwmN2iCId84VbT247azf3Cb0Zi4
         MkgpeIWcFRx6cHuyghpLboAEPymJsO2T+hb5nrxEMXSmWB4JFh6dyNbL5aJoVEHntkdh
         wMoogcY0mb6GWPZcio+rBF5j2eOKfFv+KS6urTnK0PVVgo/GZG96C3tSS4Af3mkscg2h
         IsUA==
X-Gm-Message-State: AOAM532ZMBOIicEkWUAoTmEHULpHvXQ0E38D9yv1cGdhRtusgpcNqAPe
        g+FLbK5Z4+QuW8+GOgsZn9A=
X-Google-Smtp-Source: ABdhPJyqQiTHPCKdiLCdDiI43VNXbWGbJEbSVIHUpmNUzTN/lb+7fdTD4qHKBYF8CsuEj7tFszXISg==
X-Received: by 2002:aa7:8754:: with SMTP id g20mr3573837pfo.236.1589339903714;
        Tue, 12 May 2020 20:18:23 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id b67sm12395663pfg.60.2020.05.12.20.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 20:18:23 -0700 (PDT)
Date:   Tue, 12 May 2020 20:18:21 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Brian Masney <masneyb@onstation.org>
Cc:     robh+dt@kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, sboyd@kernel.org,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 RESEND 1/2] dt-bindings: Input: remove msm-vibrator
Message-ID: <20200513031821.GG89269@dtor-ws>
References: <20200513013140.69935-1-masneyb@onstation.org>
 <20200513013140.69935-2-masneyb@onstation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200513013140.69935-2-masneyb@onstation.org>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, May 12, 2020 at 09:31:39PM -0400, Brian Masney wrote:
> The address referenced in this binding is within the Qualcomm Clock
> namespace so let's drop the msm-vibrator bindings so that a more
> generic solution can be used instead.  No one is currently using these
> bindings so this won't affect any users.
> 
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> Acked-by: Rob Herring <robh@kernel.org>

Applied, thank you.

-- 
Dmitry
