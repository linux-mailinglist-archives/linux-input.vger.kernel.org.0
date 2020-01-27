Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CFD514ABE5
	for <lists+linux-input@lfdr.de>; Mon, 27 Jan 2020 23:07:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726164AbgA0WHb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 Jan 2020 17:07:31 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:54948 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725946AbgA0WHb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 Jan 2020 17:07:31 -0500
Received: by mail-pj1-f66.google.com with SMTP id dw13so82321pjb.4;
        Mon, 27 Jan 2020 14:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=GzZ81ZEB3FexxpeWkdJYSX4VHFVl98wy55kAFWIKurk=;
        b=SW8fw8Kv65E5kRPBcFxSq1S0yfzeKGhKoEbZ1/oV6Vr6tVcw3yiY2MgrPxThU0SMhe
         /9mQQMByPwmz9jjzaCNcbc/khCZu4ghiWvJGdnfApwwnFrQyWePNJrNTmaxiRjk7k8h9
         7vE76mphD8sVLefjs4Y3jVxzvgGTFPOHLrR36C5mLbkL5AwbmyWKUHg7ai9stXc4YP6E
         1Nz1fv1UG/ZTi9CZuBSC9hXAD3vgLN5SX7/WX92Vdb1C2rSRXP9sjuGz7oA89yRt9o4J
         kNkFabthAVJvkW9OFd/mhAcHXm1bCzDc+B5HeozdBtutwX+RFbbhcbCLBKqbU8rbQkQ+
         cqlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GzZ81ZEB3FexxpeWkdJYSX4VHFVl98wy55kAFWIKurk=;
        b=nZe/PRpFWvsK8Qp9NgnTXunj+Kv0Ml+KdNajLtIuv88GSNJraEb8vcDJ5IraBaIY4U
         C6WvxfQDUnUE9kkhDH4xfK4RxSkhff56Oy0OcyWW7+zpqjqwcEezC1HGiCvtyRtrTO5J
         b5RBR1MNg+XBhTpt4jS4gVx3ygvVKssHR2++4vE3ttwvFS/CoWL5xk/ZEzXsFR2QLsjH
         wqaJgmKEpkdtdM3oij44YQaWG7IrGvYjo/dSjHYcRm/bP9XKEs6A9ebcaah6LP1wLbME
         YMj0kOAO+tKWT9VOo+nzopucq6mw6F8JtyhGN+pOWkpY/xfgRHEUJ17L9PkfaP5DnBkP
         5PjA==
X-Gm-Message-State: APjAAAUYCF7cBQaLzxVMCxex1Ah+CPEXXzST23AgQCYmd74W2/8VeoZG
        9HU9R/j1116Ht4HAEA4tEnUWwArJ
X-Google-Smtp-Source: APXvYqy34ij2kuHrKL9gi6NW9NdItOwONjQSxznYbO41dtKKWoZpq+XV++EkUqQKcamDfhylXgFg9A==
X-Received: by 2002:a17:902:a50d:: with SMTP id s13mr18863509plq.293.1580162850717;
        Mon, 27 Jan 2020 14:07:30 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id 3sm16651155pfi.13.2020.01.27.14.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2020 14:07:30 -0800 (PST)
Date:   Mon, 27 Jan 2020 14:07:27 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Benjamin Gaignard <benjamin.gaignard@st.com>, robh+dt@kernel.org,
        mark.rutland@arm.com, hadess@hadess.net,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, yannick.fertre@st.com
Subject: Re: [PATCH v2 1/2] dt-bindings: touchscreen: Add touchscreen schema
Message-ID: <20200127220727.GE184237@dtor-ws>
References: <20200108091118.5130-1-benjamin.gaignard@st.com>
 <20200108091118.5130-2-benjamin.gaignard@st.com>
 <20200114233010.GA21560@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200114233010.GA21560@bogus>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jan 14, 2020 at 05:30:10PM -0600, Rob Herring wrote:
> On Wed, 8 Jan 2020 10:11:17 +0100, Benjamin Gaignard wrote:
> > Add touchscreen schema for common properties
> > 
> > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> > ---
> > version 2:
> > - remove old definition in touchscreen.txt
> > - add type for all properties
> > - add dependencies between properties 
> > 
> >  .../bindings/input/touchscreen/touchscreen.txt     | 40 +----------
> >  .../bindings/input/touchscreen/touchscreen.yaml    | 83 ++++++++++++++++++++++
> >  2 files changed, 84 insertions(+), 39 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
> > 
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied, thank you.


-- 
Dmitry
