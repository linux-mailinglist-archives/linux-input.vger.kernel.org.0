Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A38D4635D6
	for <lists+linux-input@lfdr.de>; Tue, 30 Nov 2021 14:52:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241812AbhK3NzZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Nov 2021 08:55:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241810AbhK3NzU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Nov 2021 08:55:20 -0500
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1035BC06174A
        for <linux-input@vger.kernel.org>; Tue, 30 Nov 2021 05:52:01 -0800 (PST)
Received: by mail-yb1-xb36.google.com with SMTP id e136so52704026ybc.4
        for <linux-input@vger.kernel.org>; Tue, 30 Nov 2021 05:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=UV/snWQ1RquMi+a6kqw9+P/55CytUhkIhPbg1AWShdM=;
        b=u6tr3cw0EiowlojOENbUER3d7y8hXMJgKRh0Z3K1aHHjtMxeLs8/IGW/H6hGpXilrh
         JDJgOploiQVpd+XOIX3QIfwkKzSK6qAkEmpNoc5z1hGjAn/obAB9CSoTkd0GGYDrJdWx
         ZWWCjFLsr8ndE4+myBPzzQNx2rUZPhEsxTMPVllonHnWdgxwOqMqK6TVJG7Bgy0uKBF1
         U5fm28Ias93ERavnhMYfvtl3sCJiUzT+Wm78Bhrw09rA35/hUXnvsdFGR9C2dbNaliYh
         vRlu18DkvaguYx+8pmsA7xovSWHZpipxL7kn+aHS+OrHayEkS2Rk25GvWx0Nw2KArGo+
         xm5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=UV/snWQ1RquMi+a6kqw9+P/55CytUhkIhPbg1AWShdM=;
        b=K++67IJxR8f3qHtpbPuu1YQKlCVTo4wj9uUzHz/XMWlsZM98R+Uo+UQ8SMC/VuxJLX
         +Z5Ni7VIu6ectP6E8Gl46Cf6fTLbp3wRWzfyrWCYUV0i3dI2zBkl2ekFaML0lybRA98U
         8LdeyFelDHnnRptfG2Fs2HGaQcoUGiGTgYi8hmiEWsiUcd4AwPRhbFtb5dZVfwxLoIrI
         BoyzoJutLjRCD6H0tgFUkAsEExih89nqXga0r5gsi0jPRrKDxyMNGAngToJ4x1TdzWmY
         L/SvqB9ruyJDMwJ6YkPfyeDjIUWxJPZ0FrnnpFa6JueqZV+n4ycHJqe8dN030BJaNtmF
         gIuQ==
X-Gm-Message-State: AOAM532w5UwmdPiUVX2/SUfkqYfiGkKUaAbXDPV/rQm4PdAFbzc+nuym
        WxAN2OxELu8gGx488gnzC1ZdTEpWuIyW04De0T15/A==
X-Google-Smtp-Source: ABdhPJzInh13FLsRAlO8EkKJIGgSr7sZg9AByqdLPE4h/D0W6PeiCGZa7R7MZ2XzlcUn3khQ3Q5kwBgkxX/g90wniOo=
X-Received: by 2002:a25:9011:: with SMTP id s17mr42182684ybl.545.1638280319478;
 Tue, 30 Nov 2021 05:51:59 -0800 (PST)
MIME-Version: 1.0
From:   Angela Czubak <acz@semihalf.com>
Date:   Tue, 30 Nov 2021 14:51:48 +0100
Message-ID: <CAB4aORVm7hFDVE_zekZZxTEkXgBJD=HzEekMWNAZs3kV05JU7w@mail.gmail.com>
Subject: Re: Forcepad interface design proposal
To:     benjamin.tissoires@redhat.com, peter.hutterer@who-t.net,
        linux-input@vger.kernel.org
Cc:     seobrien@chromium.org, jikos@kernel.org,
        Dmitry Torokhov <dtor@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Benjamin and Peter,

I am refreshing this old thread in order to clarify some things
discussed here :)
I specifically got lost when reading about virtual IDs for effects.
Asking more inline.

On Thu, Apr 18, 2019 at 7:00 AM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> On Fri, Apr 12, 2019 at 8:32 PM Sean O'Brien <seobrien@chromium.org> wrot=
e:
> >
> > On Fri, Apr 12, 2019 at 12:42 AM Peter Hutterer <peter.hutterer@who-t.n=
et> wrote:
> > >
> > > Ahoi!
> > >
> > > On Thu, Apr 11, 2019 at 11:24:30AM -0700, Sean O'Brien wrote:
> > > > Hi Benjamin and Peter,
> > > >
> > > > Thanks for your detailed replies. I'm glad you found it interesting=
 :)
> > > >
> > > > On Wed, Apr 10, 2019 at 5:47 PM Peter Hutterer <peter.hutterer@who-=
t.net> wrote:
> > > > >
> > > > > Hey!
> > > > >
> > > > > I just have a few notes on top of what Benjamin said.
> > > > >
> > > > > On Wed, Apr 10, 2019 at 06:51:45PM +0200, Benjamin Tissoires wrot=
e:
> > > > > > Hi Sean,
> > > > > >
> > > > > > On Wed, Apr 10, 2019 at 1:29 AM Sean O'Brien <seobrien@chromium=
.org> wrote:
> > > > > > >
> > > > > > > Hello,
> > > > > > >
> > > > > > > I'm currently working on designing an interface for controlli=
ng "forcepads";
> > > > > > > that is, touchpads with force sensors and haptic actuators. B=
elow is my
> > > > > > > proposal for the protocol at both the userspace and HID inter=
faces. I would
> > > > > > > appreciate any feedback you might have.
> > > > > >
> > > > > > Thanks a lot for starting this discussion. This is indeed an
> > > > > > interesting topic, and I had a lengthy chat with Peter this mor=
ning :)
> > > > > >
> > > > > > First, I'd like to get a small clarification.
> > > > > > In the proposal, you are making reference to both the HID side =
(so the
> > > > > > hardware protocol) and the kernel side (the client protocol).
> > > > > > I read it that you are trying to build two things:
> > > > > > - the HID design proposal, aimed at hardware makers
> > > > > > - the kernel behavior on how to use it
> > > > > >
> > > > > > If that is the case, I am glad that you can put some pressure t=
o force
> > > > > > a sensible protocol to hardware makers :)
> > > > > >
> > > > > > Though, I think we should make a clear separation between the 2=
. We
> > > > > > need to think of it as a whole, but the document should clearly=
 put
> > > > > > the boundaries IMO.
> > > > > >
> > > >
> > > > You are correct - there are two levels here and I'll try to make th=
e separation
> > > > more clear in future versions.
> > > >
> > > > > > >
> > > > > > > Thank you,
> > > > > > >
> > > > > > > Sean O'Brien
> > > > > > > Chromium OS Touch/Input Team
> > > > > > >
> > > > > > > Background
> > > > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > > >
> > > > > > > There are multiple independent projects to develop a touchpad=
 with force sensors
> > > > > > > and haptic actuators, instead of a traditional button. These =
=E2=80=9Cforcepads=E2=80=9D have
> > > > > > > several advantages and potential uses; they allow clicking ac=
ross the entire
> > > > > > > touchpad surface, adjusting the force requirement for clicks,=
 haptic feedback
> > > > > > > initiated by UI, etc.
> > > > > > >
> > > > > > > Objective
> > > > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > > >
> > > > > > > Develop a standard protocol to allow userspace applications t=
o communicate with
> > > > > > > forcepads, and minimize duplicated code and effort.
> > > > > > >
> > > > > > > Requirements:
> > > > > > > 1. Support UI-initiated haptic feedback.
> > > > > > > 2. Allow userspace to control when button press and button re=
lease haptic
> > > > > > >    effects are triggered. (Useful when detecting a false clic=
k, changing force
> > > > > > >    thresholds, or sending context-dependent effects)
> > > > > > > 3. Allow a backward-compatible mode where the forcepad produc=
es button press and
> > > > > > >    button release effects autonomously.
> > > > > > > 4. Reveal force sensor readings to userspace applications.
> > > > > > >
> > > > > > > Proposal
> > > > > > > =3D=3D=3D=3D=3D=3D=3D=3D
> > > > > > >
> > > > > > > I propose standardized forcepad support in the linux kernel a=
t both the HID and
> > > > > > > userspace interface.
> > > > > > >
> > > > > > > Userspace Interface
> > > > > > > -------------------
> > > > > > >
> > > > > > > Multitouch
> > > > > > > ..........
> > > > > > >
> > > > > > > The linux kernel has a well defined protocol [0] for multitou=
ch devices,
> > > > > > > including touchpads. The protocol defines a field called ABS_=
MT_PRESSURE as a
> > > > > > > measure of the pressure applied by a contact. Unfortunately, =
it is not used
> > > > > > > that way in practice- instead it is generally used as an appr=
oximate measure of
> > > > > > > contact area. I will distinguish these concepts by calling th=
em =E2=80=9Ctrue force=E2=80=9D and
> > > > > > > =E2=80=9Ctraditional pressure=E2=80=9D.
> > > > > >
> > > > > > Well, yes and now. It depends on the underlying technology.
> > > > > > For capacitive sensors, "traditional pressure" if reported thro=
ugh
> > > > > > ABS_MT_PRESSURE is the surface contact area. This is a rough
> > > > > > equivalent to a pressure, assuming we all have somehow flexible
> > > > > > fingers, and roughly the same shape. But for resistive touchscr=
eens,
> > > > > > IIRC we have already access to the "true force".
> > > > > >
> > > > > > IIRC, when both ABS_MT_MAJOR and ABS_MT_MINOR are reported, lib=
input
> > > > > > ignores ABS_MT_PRESSURE. So in a sense, there is no need to add=
 a new
> > > > > > ABS event, this one works quite well.
> > > > >
> > > > > just as an extra note here: the kernel doc for ABS_MT_PRESSURE sa=
ys "The
> > > > > pressure, in arbitrary units, on the contact area", so that's wha=
t we do in
> > > > > libinput (and the old synaptics driver) at least. We have arbitra=
ry
> > > > > thresholds but they are by device or device series. So *how* the =
pressure
> > > > > was generated by the hardware itself is already meaningless becau=
se all it
> > > > > gives us is some continuous data without useful reference points.
> > > > > IOW, using ABS_MT_PRESSURE will work just fine.
> > > > >
> > > > > And we can't just assume "if resolution is set, units are $foo" b=
ecause
> > > > > nothing written in the last decade or so will assume that. Some e=
xtra flag
> > > > > is needed, like INPUT_PROP_FORCEPAD.
> > > > >
> > > >
> > > > Great, I won't worry about the distinction then, except to say forc=
epads must
> > > > always use force and define units.
> > > >
> > > > > > >
> > > > > > > Instead of using ABS_MT_PRESSURE to report the =E2=80=9Ctradi=
tional pressure,=E2=80=9D forcepads
> > > > > > > would send =E2=80=9Ctrue force=E2=80=9D values in this field.=
 For each contact, this field would
> > > > > > > report the estimated force applied by that contact.
> > > > > > >
> > > > > > > The resolution of ABS_MT_PRESSURE should also be defined and =
reported, so that
> > > > > >
> > > > > > Please define here what units the protocol expects. And please =
make it
> > > > > > international (g/m2, N/m2 or whatever). Though Newtons might be
> > > > > > difficult to grasp for people.
> > > >
> > > > I was actually thinking Newtons (or grams), instead of g/m2 or N/m2=
. The sensors
> > > > are more directly measuring force rather than pressure. The value c=
ould be
> > > > converted to pressure based on the contact area, but this raises th=
e question of
> > > > how to report when force is applied to the pressure with no fingers=
, e.g.
> > > > pressing with an eraser or some object that doesn't trigger the cap=
acitive
> > > > sensors. If we us N or g, this value can be reported in ABS_PRESSUR=
E directly.
> > > > Otherwise I'm not sure how to convert to pressure units.
> > >
> > > I think N are just fine here. The evdev API is what it is and given t=
he
> > > circumstances I don't think don't need to attempt to be scientificall=
y exact
> > > here.
> > >
> > > > > > > userspace consumers can translate to force units. By defining=
 the resolution, we
> > > > > > > also differentiate it from how it is used to report =E2=80=9C=
traditional pressure=E2=80=9D,
> > > > > > > where it has no resolution. Userspace consumers will be able =
to use this to
> > > > > > > detect that this is a forcepad, and treat the pressure field =
accordingly.
> > > > > >
> > > > > > I tend to disagree. It is best in that case to explicitly mark =
the
> > > > > > forcepad as such by adding a new INPUT_PROP. INPUT_PROP_FORCEPA=
D would
> > > > > > be nice.
> > > > > >
> > > > > > The reason is you don't know for sure that the reported unit is
> > > > > > correct for the existing devices. If you want this to actually =
matter,
> > > > > > then you can enforce the unit to be correct for a certified dev=
ice,
> > > > > > and then only export INPUT_PROP_FORCEPAD for those devices (thi=
nking
> > > > > > at the Win8 certification blob for multitouch screens/touchpads=
).
> > > > > >
> > > > > > Note that defining what an INPUT_PROP_FORCEPAD is would be nice=
. For
> > > > > > example does the user controlled haptic feedback be a requireme=
nt.
> > > > > >
> > > > > > I would suggested:
> > > > > > - can differentiate between at least 5 fingers
> > > > > > - correct resolution for the X/Y (units and value)
> > > > > > - report correct force per touch, and correct units for them
> > > > > > - follows the MT protocol type B
> > > > > >
> > > > > > So for hardware vendors, we would require to follow the MS spec=
 for
> > > > > > input devices in Win8 and Win8.1, and in addition support the S=
imple
> > > > > > haptic controller HID table, and report correct units for the
> > > > > > pressure.
> > > > > >
> > > >
> > > > Agreed, adding a new INPUT_PROP is much cleaner, and acts as a conv=
enient label
> > > > for describing where this protocol should be followed.
> > > >
> > > > > > >
> > > > > > > ABS_PRESSURE may be optionally reported as the total force ap=
plied to the
> > > > > > > forcepad.
> > > > > > >
> > > > > > > The device/driver shouldn=E2=80=99t detect button clicks, thi=
s is left to the userspace
> > > > > > > gesture library. Accordingly, the driver should not sent BTN_=
* events to
> > > > > > > userspace in normal operating mode. However it should still r=
eport the ability
> > > > > > > to produce such events, for use in autonomous mode.
> > > > > >
> > > > > > For backward compatibility, and to be able to debug it properly=
, you
> > > > > > should keep the BTN_* events emulated in all cases.
> > > > > > The userspace can ignore the events it doesn't want this way, b=
ut you
> > > > > > will be able to debug the btn emulations on your current sessio=
n
> > > > > > without having to kill your compositor.
> > > > > > There shouldn't be much of a head over forwarding those events,=
 as it
> > > > > > will never come alone, and will always be with an other one at =
least
> > > > > > (pressure being 0 or less).
> > > > > >
> > > > > > Also, not sending BTN_TOUCH and BTN_LEFT might give some headac=
hes to
> > > > > > legacy applications.
> > > > > >
> > > >
> > > > This also makes the difference between host-controlled and autonomo=
us mode
> > > > smaller, so this sounds good to me.
> > > >
> > > > > > >
> > > > > > > Haptic Control
> > > > > > > ..............
> > > > > > >
> > > > > > > The force feedback protocol [1] should be used to request pre=
defined effects.
> > > > > >
> > > > > > s/request/control/
> > > > > >
> > > > > > >
> > > > > > > Typical use of the force feedback protocol requires loading e=
ffects to the
> > > > > > > driver by describing the output waveform, and then requesting=
 those effects
> > > > > > > using an ID provided by the driver. We don=E2=80=99t want to =
describe the output
> > > > > > > waveform explicitly, but instead use a set of predefined IDs =
for the desired
> > > > > > > effect types. The device/driver would be responsible for havi=
ng the effects
> > > > > > > loaded and ready to respond to a request for the predefined I=
Ds.
> > > > > >
> > > > > > Re-reading through this made my head a little bit clearer.
> > > > > >
> > > > > > I think I am starting to see what you are saying, but the propo=
sal
> > > > > > would need to be more precised here.
> > > > > >
> > > > > > >
> > > > > > > The force feedback protocol will need to be extended to allow=
 requests for
> > > > > > > predefined IDs. This requires a new feedback effect type:
> > > > > > >
> > > > > > >     /**
> > > > > > >      * struct ff_predefined_effect
> > > > > > >      * @level: strength of the effect
> > > > > > >      * @vendor: ID of the vendor who defined the effect
> > > > > > >      * @id: ID of the effect among those defined by the vendo=
r
> > > > > > >      */
> > > > > > >     struct ff_predefined_effect {
> > > > > > >             __s16 level;
> > > > > > >             __u16 vendor;
> > > > > > >             __u16 id;
> > > > > > >     }
> > > > > > >
> > > > > > > Vendors can define specifications for the waveforms and assig=
n them IDs. They
> > > > > > > could then be requested using their vendor ID and the wavefor=
m ID, as defined in
> > > > > > > the simple haptic HID protocol [2].
> > > > > > >
> > > > > > > To allow a standard way to trigger press and release effects,=
 all forcepads
> > > > > > > should support the WAVEFORM_PRESS and WAVEFORM_RELEASE throug=
h this interface.
> > > > > > > Since the standard waveform id namespace doesn=E2=80=99t over=
lap with the vendor
> > > > > > > waveform id namespace, the vendor id can be ignored for these=
 waveforms.
> > > > > >
> > > > > > First of all, I think you should split the HID (device/firmware=
)
> > > > > > requirements from how they are used in the kernel.
> > > > > >
> > > > > > IMO, it's fine to say that only touchpads exporting the "simple=
 haptic
> > > > > > HID protocol [2]" will be supported by this proposal.
> > > > > >
> > > >
> > > > This is position I'd like to take, to discourage a proliferation of=
 different
> > > > protocols.
> > > >
> > > > > > And FWIW, the Microsoft Surface Dial already exposes this HID
> > > > > > collection, and can be used to toy around the proposal (just sa=
ying).
> > > > > >
> > > > > > If you intend to be more generic, we should not refer to this H=
ID
> > > > > > collection but explain how things are going to be in shape in t=
he
> > > > > > kernel.
> > > > > >
> > > > > > That being said, there are a few additions/changes I'd like to =
see.
> > > > > >
> > > > > > The way the input_ff protocol works is:
> > > > > > - userspace upload an effect through EVIOCSFF and stores it in =
an id
> > > > > > - this effect is supposedly stored into the device itself
> > > > > > - userspace can then play the effect whenever it wants by calli=
ng the
> > > > > > id in an input_event written to the evdev node
> > > > > > - eventually, userspace can remove the effect with EVIOCRMFF
> > > > > >
> > > > > > This doesn't entirely matches the simple haptic HID protocol.
> > > > > >
> > > > > > As I read the documentation, the simple haptic HID only defines=
 a set
> > > > > > of waveform types:
> > > > > > WAVEFORM_NONE, WAVEFORM_STOP, WAVEFORM_CLICK,
> > > > > > WAVEFORM_BUZZ_CONTINUOUS, WAVEFORM_RUMBLE_CONTINUOUS, WAVEFORM_=
PRESS,
> > > > > > and WAVEFORM_RELEASE. It also defines a "vendor" range where ve=
ndors
> > > > > > can put any waveform they see fit and define in their haptic de=
vice.
> > > > > >
> > > > > > So, I think that's why you want to augment the ff protocol by a=
dding
> > > > > > the struct ff_predefined_effect.
> > > > > >
> > > > > > After thinking more about that, you are correct, we can not exp=
ress
> > > > > > those "simple haptic HID" waveforms in the current ff protocol.=
 But I
> > > > > > think the new struct should be focused on HID, not vendors, and
> > > > > > contains the whole effect settings. All the current struct ff_*=
_effect
> > > > > > also have the period, the magnitude, the offset, etc...
> > > > > >
> > > > > > Re-reading through the HID HUTRR, I think we should add Intensi=
ty,
> > > > > > Repeat Count, and Duration.
> > > > > >
> > > > > > So I would prefer to have a more generic ff_effect:
> > > > > > struct ff_hid_effect {
> > > > > >     __u16 hid_usage;
> > > > > >     __s16 intensity;
> > > > > >     __u16 repeat_count;
> > > > > >     __u16 duration;
> > > > > > }
> > > > > >
> > > > > > The id is already part of struct ff_effect, so this should allo=
w us to
> > > > > > "upload" a predefined hid effect.
> > > > > >
> > > > > > Note that as I read it, we do not want auto-triggered haptic fe=
edback
> > > > > > here. If we do, we would nee to add an other field to the
> > > > > > ff_hid_effect struct.
> > > > > >
> > > > > >
> > > > > > The next thing I'd like to get some clarifications is how these
> > > > > > effects are used. As I read it, userspace "uploads" the effect,=
 and
> > > > > > uses it, but the HID HUTRR doesn't say that the effects and par=
ameters
> > > > > > are stored in the device itself. It is for the auto triggered o=
nes,
> > > > > > but given that we want to opt for the manual trigger, we should=
 store
> > > > > > it ourselves.
> > > > > >
> > > >
> > > > My understanding is that all the simple haptic effects are indeed s=
tored in the
> > > > device. Certain parameters (intensity, repeat_count, retrigger_peri=
od) are
> > > > dynamic, but the list of available waveforms (WAVEFORM_PRESS etc.) =
and their
> > > > associated durations are static properties of the device.
> > > >
> > > > In fact, I think we will want to add a mechanism for userspace to a=
sk for a list
> > > > of all available waveforms, instead of querying for each specific w=
aveform it
> > > > may be interested in.
> > >
> > > Do we have a specific use-case for this?  APIs that allow listing thi=
ngs
> > > that are otherwise basically random are mostly useful for debugging t=
ools
> > > (where performance isn't usually an issue) but nothing else. If you a=
re a
> > > userspace process and I give you a list of WAVEFORM_PRESS, WAVEFORM_R=
ELEASE,
> > > 0x1231113, 0x11aaab1123 and 0x112abff11, what will you do with that
> > > information? if you have #defines for some of them (e.g. press, relea=
se) you
> > > can query them directly. If not - does it matter what else I support?
> > >
> > > As a library author, I can definitely say that an API that only allow=
s "do
> > > you have capability $FOO" is a lot simpler to support than "give me a=
ll
> > > capabilities you know of".
> > >
> >
> > Makes sense, that works for me.
>
> [coming back after 4 days of PTO]
>
> The one thing I wanted to add here is that I am not so sure we need an
> API to know what capabilities are present in the device:
> - they are exported in the report descriptor, so a call to fetch it
> from hidraw or the sysfs is theoretically enough to get the
> information (there is the parsing, but... heh)
> - they have a one time usage, when you connect the device (at boot
> likely) and according to the discussion should be set by an external
> helper.
>
> So I would suggest to keep things to the minimum (i.e. not having a
> query API), get a first design proposal in addition to the spec
> proposal and then decide on whether we need a brand new kernel API for
> that.
>
> Also, we could skip this step entirely by having a helper that tries
> to store 0x1231113 in id 5 and expect an error if the feature is not
> available.
> It is not that bad if we have a userspace db of devices in the end.
>
> Cheers,
> Benjamin
>
> >
> > > > So we would add FF_SIMPLE to the features bitfield. If this feature=
 is
> > > > supported, userspace can use a new ioctl to find the supported simp=
le effects:
> > > >
> > > > struct input_ff_request_simple {
> > > >     __u16 vendor_id;
> > > >     __u16 vendor_page;
> > > >     __u16 hid_usages[num_effects];
> > > >     __u16 durations[num_effects];
> > > > }
> > > >
> > > > In this case vendor_id and vendor_page apply to all the waveforms i=
n the vendor
> > > > range.
> > > >
> > > > Then userspace can "upload" effects with:
> > > >
> > > > struct ff_hid_effect {
> > > >     __u16 hid_usage;
> > > >     __s16 intensity;
> > > >     __u16 repeat_count;
> > > >     __u16 retrigger_period;
> > > > }
> > > >
> > > > > > So, the solution we came to this morning, while talking to Pete=
r, was
> > > > > > that the HID driver for a simple haptic HID device would alloca=
te a
> > > > > > virtual device memory to store the effects and the parameters.
> > > > > >
> > > > > > This way, we can:
> > > > > > - upload effect WAVEFORM_RELEASE with its parameters in id 0 of=
 the
> > > > > > drvdata of the device
> > > > > > - upload effect WAVEFORM_PRESS with its parameters in id 1 of t=
he
> > > > > > drvdata of the device
> > > > > > - ...
> > > > > > - upload effect WAVEFORM_VENDOR_ZZZ_ZZZ with its parameters in =
id N of
> > > > > > the drvdata of the device -> userspace will use it while scroll=
ing for
> > > > > > instance
> > > > > > - ...
> > > > > >
> > > > > > Then the kernel on BTN_LEFT press can automatically trigger the=
 effect
> > > > > > with id 1 and the one with id 0 on release in the case of the
> > > > > > autonomous mode mentioned below.
> > > > > >
> > > > > > To solve the question of knowing which effect should be loaded =
in
> > > > > > which slot, I think we should rely on a userspace helper (udev?=
).
> > > > > > We definitively not want the kernel to keep a list of devices t=
o
> > > > > > effects matches, but having a udev database (hwdb and intrinsic=
?)
> > > > > > would nicely solve the issue as we do not need to update the ke=
rnel
> > > > > > for each new device coming in.
> > > > > >
> > > > > > From the kernel driver, we can populate the WAVEFORM_PRESS and
> > > > > > WAVEFORM_RELEASE with some sensible parameters, but userspace s=
hould
> > > > > > be allowed to override them.
> > > > > >
> > > > > > The advantage of having this virtual memory of device effects, =
is that
> > > > > > each userspace implementation could use its own matching for ef=
fects.
> > > > > > For example, libinput might want to say:
> > > > > > - id 0 -> BTN_LEFT released
> > > > > > - id 1 -> BTN_LEFT pressed
> > > > > > - id 0x1000 -> scrolling up
> > > > > > - id 0x1001 -> scrolling down
> > > > > > - id 0x2042 -> hard press
> > > > > >
Was there some idea up then to implement virtual effect IDs? Right now
it seems that
the number of possible FF effects is limited to FF_MAX_EFFECTS and
that it is the kernel
and not the user space that assigns the ID when an effect is uploaded.
Or was it more of a suggestion for the future than a requirement
regarding the simple haptic
feedback implementation?

> > > > > > But chromeOS might use different ids and different meaning for =
them.
> > > > > > The first 2 ids first should be reserved for the kernel button =
left
> > > > > > emulation though.
> > > > > >
> > > > > > Note that given that the effect memory is 'virtual' in the driv=
er, we
> > > > > > can use any id and we are not limited to a few numbers of them.
> > > > > >
> > > > > > An other thing is that we do not need to require WAVEFORM_PRESS=
 and
> > > > > > WAVEFORM_RELEASE. If they are set in the haptic device, the ker=
nel can
> > > > > > set them for us, but if they are not, userspace can always deci=
de to
> > > > > > put one of the other waveforms in ids 0 and 1.
> > > > > >
> > > > > > We should mention that not defining these two waveforms will in=
duce a
> > > > > > state were no haptic feedback will be automatically loaded from=
 the
> > > > > > kernel though (userspace will have to do it).
> > > >
> > > > True, I guess I would say it's strongly encouraged to include WAVEF=
ORM_PRESS and
> > > > WAVEFORM_RELEASE for that reason.
> > > >
> > > > > >
> > > > > > >
> > > > > > > Autonomous mode
> > > > > > > ---------------
> > > > > > >
> > > > > > > In order to facilitate an operating system which cannot handl=
e force feedback,
> > > > > > > the forcepad should start up in =E2=80=9Cautonomous mode=E2=
=80=9D, meaning it acts as a normal
> > > > > > > touchpad. This means it should perform the press and release =
haptic feedback
> > > > > > > autonomously at predefined force thresholds, and send the app=
ropriate BTN_*
> > > > > > > events.
> > > > > >
> > > > > > I think that if we were to follow my idea of using effect ids 0=
 and 1
> > > > > > for release/press, we should mention that the kernel will play =
the
> > > > > > effects stored as these ids.
> > > > > >
> > > > > > >
> > > > > > > After verifying that all of the required haptic effects are a=
vailable through
> > > > > > > the force feedback protocol, the OS can enable host-controlle=
d mode. This could
> > > > > > > be done by writing to a sysfs node =E2=80=9Chost_feedback_ena=
bled=E2=80=9D.
> > > > > >
> > > > > > You don't really want a sysfs file here. Because if the input p=
art
> > > > > > generating the haptic feedback crashes, or if you are VT switch=
ing and
> > > > > > your evdev node gets revoked, you are left in a system without =
haptic
> > > > > > feedback for clicks.
> > > > >
> > > > > Extra note here: compositors don't have write access to sysfs. so=
me do, but
> > > > > the default assumption is that they don't.
> > > > >
> > > > > > So, our idea was to use a new couple of ioctls, EVIOCFFTAKEMAST=
ER and
> > > > > > EVIOCFFRELEASEMASTER (or whatever is more politically admitted)=
, which
> > > > > > the kernel would ref count on each effect id.
> > > > > >
> > > > > > So, if the OS decides to take control over the press autonomous=
 haptic
> > > > > > feedback, it will emit the ioctl EVIOCFFTAKEMASTER with the eff=
ect id
> > > > > > 1. If an other client also wants to control this id, it can als=
o take
> > > > > > the control, and the total count of clients controlling this ef=
fect id
> > > > > > is now 2. If a BTN_LEFT is emitted by the device (or emulated b=
y the
> > > > > > kernel), the driver will check the refcount of the effect id, s=
ees
> > > > > > that there is at least one, and will not forward the haptic eff=
ect to
> > > > > > the device.
> > > > > > On the contrary, in this case, effect id 0 is not handled by
> > > > > > userspace, and the kernel will control it when a BTN_LEFT relea=
se is
> > > > > > emitted.
> > > > > >
> > > > > > Note that this ioctl will only have an impact on effect ids 0 a=
nd 1.
> > > > >
> > > > > hmm, I don't think there's a technical reason for that limitation=
, is there?
> > > > > simply specifying it as "any effect ID that does not have a curre=
nt master
> > > > > will not get auto-played by the kernel". Simple enough and leaves=
 the actual
> > > > > usage more flexible.
> > > > >
> > > > > > The benefit of using an ioctl is that is the client closes the =
fd, or
> > > > > > if the fd gets revoked, the kernel can decrement de usage count=
 and
> > > > > > eventually switch back to the autonomous mode described above.
> > > > >
> > > > > I'll add a shorter summary for the normal case, just to make it e=
asier to
> > > > > comprehend the whole thing:
> > > > > - the kernel has default effects for ids 0/1
> > > > > - some process (udev) uploads device-specific waveforms where nee=
ded, for ids
> > > > >   0/1 and others if need be
> > > > > - the kernel always sends BTN_LEFT when some hardcoded threshold =
is met
> > > > > - when sending BTN_LEFT, the kernel plays id 0/1 for release/pres=
s
> > > > > - if a process has the EVIOCFFTAKEMASTER for a given id, the kern=
el does not
> > > > >   play it and relies on that client to do so.
> > > > >
> > > > > This approach means:
> > > > > - default behaviour is predictable and useful
> > > > > - updating for devices is in userspace
> > > > > - the entity controlling the click-buzz (e.g. libinput) doesn't n=
eed to be
> > > > >   aware of the device-specific waveforms
> > > > > - VT-switch/compositor change/suspend/... (i.e. close(fd)) restor=
es default
> > > > >   behaviour
> > > > > - other processes can use the pad for haptic feedback without int=
erfering or
> > > > >   having to care about whether the session supports forcepads for=
 button
> > > > >   handling
> > > > >
> > > > > > > When the host enters suspend mode, the OS will not be able to=
 respond quickly
> > > > > > > enough to input from the touchpad to tell it to perform hapti=
c feedback, making
> > > > > > > the touchpad feel unresponsive. When the host suspends, the t=
ouchpad should
> > > > > > > enter autonomous mode.
> > > > > >
> > > > > > This could be achieved in my proposal above by either closing t=
he fd,
> > > > > > or revoking it, so we would get this for free :)
> > > > > >
> > > > > > >
> > > > > > > HID Interface
> > > > > > > -------------
> > > > > >
> > > > > > So this is the part where we tell ODM what to do. Correct?
> > > > > >
> > > > > > >
> > > > > > > Multitouch
> > > > > > > ..........
> > > > > > >
> > > > > > > The HID API for multitouch reports is mostly unchanged except=
:
> > > > > > >
> > > > > > > 1. The tip pressure field [3] should be used to report =E2=80=
=9Ctrue force=E2=80=9D instead of
> > > > > > >    =E2=80=9Ctraditional pressure=E2=80=9D. The physical unit =
type, exponent, and limits should
> > > > > > >    be reported in the report descriptor for the =E2=80=9Ctrue=
 force=E2=80=9D field [4].
> > > > > >
> > > > > > works for me
> > > > > >
> > > > > > > 2. The device will always report it=E2=80=99s button as being=
 unpressed, except in
> > > > > > >    autonomous mode, when it will report the button state acco=
rding to its
> > > > > > >    predefined force thresholds.
> > > > >
> > > > > fwiw, devices that report capabilities but never send those event=
s are a
> > > > > nightmare to deal with because it forces heuristics and guesswork=
 in the
> > > > > clients that can be wrong at any point. Filtering events because =
we pretend
> > > > > to know better than the kernel driver is a lot easier.
> > > > >
> > > > > Cheers,
> > > > >    Peter
> > > > >
> > > > >
> > > > > > I think I would prefer having a basic left button emulation tha=
t we
> > > > > > can rely on when userspace doesn't know about forcepads.
> > > > > > This would allow us to not have to emulate it in the kernel, bu=
t just
> > > > > > forward the data as it comes in.
> > > > > >
> > > > > > Also, this would allow the driver to not have to drive the hapt=
ic
> > > > > > feedback in the autonomous mode: we just set the auto trigger o=
n
> > > > > > BTN_LEFT usage, and done.
> > > > > > (if we do not enforce the auto triggering, then the driver will=
 also
> > > > > > have to manually send the haptic events on BTN_LEFT 0/1).
> > > > > >
> > > >
> > > > This all sounds good to me. However, I don't think I was entirely c=
lear. When I
> > > > said "autonomous mode", I meant more "device-controlled". So really=
 there are
> > > > three modes to think about:
> > > >
> > > > - Userspace-controlled: Some process has emited ioct EVIOCFFTAKEMAS=
TER for ids
> > > >   0/1. The device will emit BTN_LEFT at some hardcoded force thresh=
old. The
> > > >   kernel will forward those events to userspace but will not play h=
aptic
> > > >   effects.
> > > > - Kernel-controlled: Nobody has taken control of ids 0/1 so the ker=
nel will
> > > >   default to playing id 0/1 whenever BTN_LEFT changes.
> > > > - Device-controlled: The auto trigger is set on the device, associa=
ted with
> > > >   BTN_LEFT.
> > > >
> > > > I want device-controlled mode because if the system suspends, I wan=
t the device
> > > > to be able to respond with haptic effects for press and release qui=
ckly. So the
> > > > kernel should set the auto trigger when suspending.
> > > >
> > > > However, there is a limitation of the HUTRR: only one waveform can =
be set as the
> > > > auto trigger, so we would have to choose one waveform to be played =
for both
> > > > press and release. Therefore, I would like to use kernel-controlled=
 mode when
> > > > the system is not suspended, so it can send the correct waveform.
> > >
> > > We're blurring the HID vs evdev distinction and I'm not sure which on=
e
> > > you're discussion here but: from userspace, kernel vs device-controll=
ed is
> > > an implementation detail of the kernel. so is having only one auto-tr=
igger,
> > > just play the same one for press release when you must, and do the ri=
ght
> > > thing otherwise.
> > >
> > > probably obvious and we all agree here, but let's state it out loud a=
t least
> > > once :)
> > >
> >
> > That's exactly right. Userspace won't know the difference between kerne=
l or
> > device-controlled. And the device won't know the difference between use=
rspace
> > and kernel-controlled.
> >
> > Best Regards,
> > Sean
> >
> > > Cheers,
> > >    Peter
> > >
> > >
> > > > > > If we are giving requirements to ODM, I think we also need:
> > > > > >
> > > > > > 3. a specific application usage that tells us that the device i=
s a forcepad.
> > > > > > Ideally, I would love to extend the HUT, but we might consider =
saying
> > > > > > that a forcepad, to be exposed as such, needs to expose a "Simp=
le
> > > > > > Haptic Controller" logical collection alongside the Touch Pad o=
ne.
> > > > > >
> > > > > > That's what the Surface dial is doing:
> > > > > > - application collection: System Multi-Axis Controller
> > > > > >   - logical collection: Puck
> > > > > >   - logical collection: Simple Haptic Controller
> > > > > >     - logical collection: Durations List
> > > > > >     - logical collection: Waveforms List
> > > > > > - endof application collection
> > > > > >
> > > > > > So this would make clear what a HID forcepad is.
> > > >
> > > > Sounds good.
> > > >
> > > > > >
> > > > > > 4. a way to store in the HID device the pressure threshold the =
device
> > > > > > is supposed to report the click.
> > > > > > We can guess which threshold it is if the unit is correct, but =
I think
> > > > > > I would rather have the device telling us this. Problem is, I c=
an not
> > > > > > find a good HID usage for that.
> > > >
> > > > Ah yes, I had thought about that a little too. Like you, I couldn't=
 find a good
> > > > HID usage. I'd appreciate any alternate suggestions for that.
> > > >
> > > > > >
> > > > > > 5. If a device doesn't meet those criteria above, it will not g=
et
> > > > > > categorized as a FORCEPAD and will not get all the fancy FF eff=
ects
> > > > > > from the OS.
> > > > > >
> > > > > > This last point is very important as this will prevent us to ha=
ve to
> > > > > > deal with quirky devices.
> > > > > >
> > > > > > Note that MS solved the issue by requiring ODM to actually test=
 their
> > > > > > devices, and then MS issues a blob in a vendor feature that is =
tested
> > > > > > to enable or not the touchscreen / touchpad gestures.
> > > > > >
> > > > > > >
> > > > > > >
> > > > > > > Haptic control
> > > > > > > ..............
> > > > > > >
> > > > > > > The simple haptic HID protocol [2] should be used.
> > > > > >
> > > > > > s/should/must/
> > > > > >
> > > > > > >
> > > > > > > The following waveforms should be supported:
> > > > > > >
> > > > > > > | WAVEFORM_NONE            | Implicit waveforms required by p=
rotocol           |
> > > > > > > | WAVEFORM_STOP            |                                 =
                  |
> > > > > > > | ------------------------ | --------------------------------=
----------------- |
> > > > > > > | WAVEFORM_PRESS           | To be used in autonomous mode an=
d host-controlled |
> > > > > > > | WAVEFORM_RELEASE         | mode to simulate button press an=
d release.        |
> > > > > >
> > > > > > I would not absolutely require those 2. If they are present, th=
e
> > > > > > kernel (driver) should set them as the default feedback (in the
> > > > > > autonomous mode), but if they aren't, it's not a big deal, the
> > > > > > userspace will have to quirk the device.
> > > > > >
> > > > > > > | ------------------------ | --------------------------------=
----------------- |
> > > > > > > | Vendor-defined waveforms | Optional waveforms to be used in=
 host-controlled  |
> > > > > > > |                          | mode, subject to vendor specific=
ation.            |
> > > > > >
> > > > > > I think we should just say that the device is free to implement=
 all
> > > > > > the waveforms it wants as per HUTRR 63b.
> > > >
> > > > Fair enough, as long as at least one waveform is declared (as is re=
quired by
> > > > HUTRR 63b) it can be designated as a forcepad. WAVEFORM_PRESS and
> > > > WAVEFORM_RELEASE are recommended but not required.
> > > >
> > > > > >
> > > > > > >
> > > > > > > All waveforms will have an associated duration; continuous wa=
veforms will not be
> > > > > > > supported.
> > > > > > >
> > > > > > > Only manual triggering will be supported through this interfa=
ce. Autonomous
> > > > > > > triggering of waveforms is enabled by putting the device in a=
utonomous mode.
> > > > > >
> > > > > > This part is ambiguous. The Auto triggering on the HUTRR 63b sa=
ys that
> > > > > > when the device emits a specific HID usage, it will also emit t=
he
> > > > > > matching haptic effect.
> > > > > > While here, you want the kernel to driver the button press/rele=
ase
> > > > > > (unless I am reading it wrong).
> > > > > >
> > > > > > Also, I think you are mixing here the HID requirements and the
> > > > > > exported kernel API. I think there is nothing wrong to comply w=
ith the
> > > > > > HUTRR 63b. We can use the auto-trigger functionality in the aut=
onomous
> > > > > > mode described above. The point is that we do not want to expor=
t that
> > > > > > to the userspace.
> > > > > >
> > > >
> > > > Yes, you are right. We can achieve the various autonomous modes
> > > > (kernel-controlled and device-controlled) through HUTRR 63b using m=
anual and
> > > > auto triggering respectively.
> > > >
> > > > > > >
> > > > > > > Retriggering (queueing multiple triggers of the same waveform=
) is not supported.
> > > > > >
> > > > > > This will simplify the new struct_hid_effect, but I am not sure=
 there
> > > > > > is a point to prevent the haptic device of having that capabili=
ty.
> > > > > >
> > > > > > >
> > > > > > > If intensity modification for waveforms is supported by the d=
evice, the
> > > > > > > intensity control should be included in the manual trigger ou=
tput report. This
> > > > > > > allows modification of the intensity on a per-waveform basis.
> > > > > >
> > > > > > yep
> > > > > >
> > > > > > So I think we should simply say that the haptic feedback needs =
to
> > > > > > follow HUTRR 63b, with the following amendments:
> > > > > > - continuous waveforms will be ignored by the host
> > > > > > - Repeat Count will be ignored by the host
> > > > > > - Auto mode trigger might get used for the autonomous mode desc=
ribed
> > > > > > above, but can be optional
> > > > > >
> > > >
> > > > I've been convinced that there's no harm in supporting retriggering=
, and that in
> > > > fact we should encourage the use of auto trigger so the device can =
perfom
> > > > effects when the system is suspended.
> > > >
> > > > Best regards,
> > > > Sean
> > > >
> > > > > > >
> > > > > > > Alternatives Considered
> > > > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > > > > > >
> > > > > > > Add a =E2=80=9Ctrue force=E2=80=9D field to the multi-touch p=
rotocol
> > > > > > > ----------------------------------------------------
> > > > > > >
> > > > > > > This allows us to send =E2=80=9Ctraditional pressure=E2=80=9D=
 in addition to =E2=80=9Ctrue force=E2=80=9D. It
> > > > > > > also allows another possible protocol in addition to sending =
the force per
> > > > > > > contact:
> > > > > > >
> > > > > > > * Sending overall force and center of force: Should be easier=
 to calculate
> > > > > > >   depending on force sensor layout, and provides potentially =
useful extra info
> > > > > > >
> > > > > > > As mentioned before, there is already a concept of pressure i=
n the multi-touch
> > > > > > > protocol, generally used as a proxy for contact area. We woul=
d add another field
> > > > > > > to represent force. However, the pressure field is defined by=
 the protocol as
> > > > > > > actual pressure, and I feel this would only add more confusio=
n. The touch_major
> > > > > > > and touch_minor fields can be used to report contact area exp=
licitly, so we're
> > > > > > > not losing that capability.
> > > > > >
> > > > > > Nope, I am not buying this idea. As mentioned above, the MT_PRE=
SSURE
> > > > > > was always intended to report the pressure of the contact. It i=
s an
> > > > > > approximation in the capacitive sensor case, but there is no po=
int in
> > > > > > adding one new event. Also, if we set the INPUT_PROP_FORCEPAD, =
it is
> > > > > > now clear that the unit and thus the resolution is reliable.
> > > > > >
> > > > > > >
> > > > > > > Report overall force, but not per-contact force
> > > > > > > -----------------------------------------------
> > > > > > >
> > > > > > > Instead of reporting the =E2=80=9Ctraditional pressure,=E2=80=
=9D send =E2=80=9Ctrue force=E2=80=9D values in the
> > > > > > > ABS_PRESSURE field.The ABS_MT_PRESSURE field would still be u=
sed to send
> > > > > > > =E2=80=9Ctraditional pressure=E2=80=9D for each contact.
> > > > > > >
> > > > > > > I'm not convinced this is necessary, or the best idea. It mak=
es backward
> > > > > > > compatibility easy, but other input libraries could detect fo=
rcepads by the
> > > > > > > resolution associated with the ABS_MT_PRESSURE field, and ign=
ore that field,
> > > > > > > using touch_major and touch_minor instead.
> > > > > > >
> > > > > > > In addition, it adds even more confusion than the above optio=
n, so I think I'd
> > > > > > > prefer a clean break.
> > > > > >
> > > > > > I think I like having the ABS_PRESSURE as the total force appli=
ed. But
> > > > > > we need per-contact force if this is available.
> > > > > > And again, I don't think we should mention the "traditional pre=
ssure"
> > > > > > as this is just a quirk from the capacitive sensors, and the ac=
tual
> > > > > > pressure was reported before those sensors came mainstream (thi=
nk of
> > > > > > resistive ones).
> > > > > >
> > > > > > >
> > > > > > > Use driver-wide gain for force feedback
> > > > > > > ---------------------------------------
> > > > > > >
> > > > > > > The force feedback protocol also has a mechanism to set drive=
r-wide gain, which
> > > > > > > could be used to set global effect strength level. However, a=
llowing different
> > > > > > > strength levels for each predefined effect would allow more f=
lexibility e.g.: if
> > > > > > > the user wants to have low strength for UI feedback effects a=
nd high strength
> > > > > > > for button click effects.
> > > > > >
> > > > > > I also think the best would be to have per effect intensity.
> > > > > >
> > > > > > Anyway, thanks a lot for putting the effort in this.
> > > > > >
> > > > > > The last bit I wanted to add is that we should define properly =
the
> > > > > > haptic and touch protocol in a way that we can support non simp=
le
> > > > > > haptic HID controllers. For example, I doubt the Apple forcepad
> > > > > > follows the HID spec, but if the driver can provide the same le=
vel of
> > > > > > quality we require to mark a device as INPUT_PROP_FORCEPAD, we =
don't
> > > > > > really care if the haptic interface is HID or not.
> > > > > >
> > > > > > Cheers,
> > > > > > Benjamin
> > > > > >
> > > > > > >

Regards,
Angela

> > > > > > > [0]: https://www.kernel.org/doc/Documentation/input/multi-tou=
ch-protocol.txt
> > > > > > > [1]: https://www.kernel.org/doc/Documentation/input/ff.txt
> > > > > > > [2]: https://www.usb.org/sites/default/files/hutrr63b_-_hapti=
cs_page_redline_0.pdf
> > > > > > > [3]: Usage ID 0x30 of HID usage table 0x0D. See chapter 16:
> > > > > > >      https://www.usb.org/sites/default/files/documents/hut1_1=
2v2.pdf
> > > > > > > [4]: See section 6.2.2.7 of the HID specification:
> > > > > > >      https://www.usb.org/sites/default/files/documents/hid1_1=
1.pdf
